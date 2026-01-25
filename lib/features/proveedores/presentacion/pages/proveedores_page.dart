import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

// Núcleo y Utilidades
import 'package:banano_proyecto_app/core/connectivity/connectivity_service.dart';
import 'package:banano_proyecto_app/core/ui/widgets/buscador_reutilizable.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';

// Providers y Modelos
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/di/proveedor_filter_providert.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';

// Widgets y Páginas
import '../widgets/proveedor_card.dart';
import 'nuevo_proveedor_page.dart';

class ProveedoresPage extends ConsumerStatefulWidget {
  const ProveedoresPage({super.key});

  @override
  ConsumerState<ProveedoresPage> createState() => _ProveedoresPageState();
}

class _ProveedoresPageState extends ConsumerState<ProveedoresPage> {
  late StreamSubscription<bool> _subscripcionConectividad;

  // Helper para verificar conexión
  bool get _hayInternet =>
      ref.read(internetConnectionProvider).valueOrNull ?? false;

  @override
  void initState() {
    super.initState();
    _inicializarPagina();
  }

  @override
  void dispose() {
    _subscripcionConectividad.cancel();
    super.dispose();
  }

  void _inicializarPagina() {
    // 1. Limpiar filtros y cargar datos al entrar
    Future.microtask(() {
      if (mounted) {
        ref.read(proveedoresFilterProvider.notifier).state =
            ProveedoresFilter();
        _cargarDatos();
      }
    });

    // 2. Escucha de internet para sincronización automática
    _subscripcionConectividad = ref
        .read(connectivityServiceProvider)
        .connectionStream
        .distinct()
        .listen((conectado) {
          if (conectado && mounted) {
            _intentarSincronizacionAutomatica();
          }
        });
  }

  Future<void> _cargarDatos() async {
    await ref.read(proveedoresControllerProvider.notifier).cargar();
  }

  // ─────────────────────────────────────────────────────────────
  // LÓGICA DE SINCRONIZACIÓN TOTAL
  // ─────────────────────────────────────────────────────────────

  Future<void> _ejecutarSincronizacionTotal() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sincronizando proveedores...'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );

    try {
      // Sube cambios locales (Outbox)
      await ref.read(syncServiceProvider).syncNow();
      // Baja lista actualizada
      await _cargarDatos();

      if (mounted) {
        MensajesGlobales.exito('Proveedores sincronizados correctamente');
      }
    } catch (e) {
      debugPrint('Error sync proveedores: $e');
      if (mounted) {
        MensajesGlobales.error('No se pudo completar la sincronización');
      }
    }
  }

  Future<void> _intentarSincronizacionAutomatica() async {
    final outbox = ref.read(outboxRepositoryProvider);
    final pendientes = await outbox.pendientes(limit: 1);
    if (pendientes.isEmpty) return;

    try {
      // 1. Ejecutar la sincronización
      await ref.read(syncServiceProvider).syncNow();
      
      // 2. IMPORTANTE: Forzar al controlador a recargar los datos de la DB local
      // Esto hará que 'pendienteSync' pase a false en la UI
      await ref.read(proveedoresControllerProvider.notifier).cargar(); 
      
    } catch (e) {
      debugPrint('Error sync automático: $e');
    }
  }

  // ─────────────────────────────────────────────────────────────
  // NAVEGACIÓN
  // ─────────────────────────────────────────────────────────────

  Future<void> _navegarNuevoProveedor() async {
    final guardado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NuevoProveedorPage()),
    );

    if (guardado == true && mounted) {
      await _cargarDatos();
      _darFeedbackPostOperacion();
    }
  }

  void _darFeedbackPostOperacion() {
    if (_hayInternet) {
      MensajesGlobales.exito('Operación exitosa');
    } else {
      MensajesGlobales.advertencia(
        'Guardado localmente. Se sincronizará al tener internet.',
      );
    }
  }

  // ─────────────────────────────────────────────────────────────
  // DISEÑO DE LA INTERFAZ (UI)
  // ─────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final estadoProveedores = ref.watch(proveedoresControllerProvider);
    final proveedoresFiltrados = ref.watch(proveedoresFiltradosProvider);
    final permisos = ref.watch(roleManagerProvider);
    final tema = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? tema.surface : Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Proveedores',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Sincronizar ahora',
            icon: Icon(
              Icons.cloud_sync_rounded,
              color: _hayInternet
                  ? tema.primary
                  : tema.outline.withOpacity(0.5),
            ),
            onPressed: _hayInternet
                ? _ejecutarSincronizacionTotal
                : () => MensajesGlobales.advertencia('Requiere internet'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      floatingActionButton: permisos.puedeCrear
          ? FloatingActionButton.extended(
              onPressed: _navegarNuevoProveedor,
              backgroundColor: tema.primary,
              foregroundColor: tema.onPrimary,
              icon: const Icon(Icons.add),
              label: const Text('Nuevo Proveedor'),
            )
          : null,
      body: Column(
        children: [
          _construirFiltros(tema, isDark, permisos.esAdministrador),
          Expanded(
            child: estadoProveedores.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => _construirVistaError(e),
              data: (_) => proveedoresFiltrados.isEmpty
                  ? _construirVistaVacia(tema)
                  : _construirListaProveedores(proveedoresFiltrados, permisos),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirFiltros(ColorScheme tema, bool isDark, bool esAdmin) {
    final filtro = ref.watch(proveedoresFilterProvider);
    final tieneFiltrosActivos =
        filtro.searchQuery.isNotEmpty || filtro.soloActivos != null;

    return Column(
      children: [
        BuscadorReutilizable<ProveedoresFilter>(
          filtroProvider: proveedoresFilterProvider,
          hintBusqueda: 'Nombre, RUC o teléfono...',
        ),
        if (esAdmin)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              children: [
                Expanded(child: _dropdownEstado(tema, isDark, filtro)),
                if (tieneFiltrosActivos) ...[
                  const SizedBox(width: 8),
                  IconButton.filledTonal(
                    onPressed: () =>
                        ref.read(proveedoresFilterProvider.notifier).state =
                            ProveedoresFilter(),
                    tooltip: 'Limpiar filtros',
                    icon: const Icon(Icons.filter_alt_off_rounded),
                    style: IconButton.styleFrom(
                      backgroundColor: tema.errorContainer.withOpacity(0.7),
                      foregroundColor: tema.onErrorContainer,
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  Widget _dropdownEstado(
    ColorScheme tema,
    bool isDark,
    ProveedoresFilter filtro,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? tema.surfaceContainer : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: tema.outlineVariant.withOpacity(0.5)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: filtro.soloActivos == true
              ? 'activos'
              : filtro.soloActivos == false
              ? 'inactivos'
              : 'todos',
          isExpanded: true,
          icon: Icon(Icons.filter_list, color: tema.primary, size: 20),
          items: const [
            DropdownMenuItem(
              value: 'todos',
              child: Text('Todos los proveedores'),
            ),
            DropdownMenuItem(value: 'activos', child: Text('Solo Activos')),
            DropdownMenuItem(value: 'inactivos', child: Text('Solo Inactivos')),
          ],
          onChanged: (val) {
            final notifier = ref.read(proveedoresFilterProvider.notifier);
            if (val == 'activos')
              notifier.state = filtro.copyWith(soloActivos: true);
            else if (val == 'inactivos')
              notifier.state = filtro.copyWith(soloActivos: false);
            else
              notifier.state = filtro.copyWith(soloActivos: null);
          },
        ),
      ),
    );
  }

  Widget _construirListaProveedores(
    List<ProveedorEntity> lista,
    dynamic permisos,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 80),
      itemCount: lista.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) {
        final p = lista[i];
        return ProveedorCard(
          proveedor: p,
          // Asegúrate de que ProveedorCard reciba esta prop para el icono amarillo
          showPendingBadge: p.pendienteSync,
        );
      },
    );
  }

  // --- Vistas de Soporte ---

  Widget _construirVistaVacia(ColorScheme tema) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_off_outlined,
            size: 70,
            color: tema.outline.withOpacity(0.4),
          ),
          const SizedBox(height: 16),
          const Text(
            'No se encontraron proveedores',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _construirVistaError(Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 50, color: Colors.redAccent),
          const SizedBox(height: 16),
          Text('Error: $error'),
          TextButton(onPressed: _cargarDatos, child: const Text('Reintentar')),
        ],
      ),
    );
  }
}
