import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  bool get _hayInternet => ref.read(internetConnectionProvider).valueOrNull ?? false;

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
    Future.microtask(() {
      if (mounted) {
        ref.read(proveedoresFilterProvider.notifier).state = ProveedoresFilter();
        _cargarDatos();
      }
    });

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

  Future<void> _ejecutarSincronizacionTotal() async {
    try {
      await ref.read(syncServiceProvider).syncNow();
      await ref.read(proveedoresControllerProvider.notifier).cargar();
    } catch (e) {
      debugPrint('Error sync proveedores: $e');
      MensajesGlobales.error('No se pudo completar la sincronización');
    }
  }

  Future<void> _intentarSincronizacionAutomatica() async {
    final outbox = ref.read(outboxRepositoryProvider);
    final pendientes = await outbox.pendientes(limit: 1);
    if (pendientes.isEmpty) return;

    try {
      await ref.read(syncServiceProvider).syncNow();
      await ref.read(proveedoresControllerProvider.notifier).cargar(); 
    } catch (e) {
      debugPrint('Error sync automático: $e');
    }
  }

  // ─────────────────────────────────────────────────────────────
  // COMPONENTES DE INTERFAZ
  // ─────────────────────────────────────────────────────────────

  Widget _construirBannerOffline() {
    return Container(
      width: double.infinity,
      color: Colors.orange.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: const Row(
        children: [
          Icon(Icons.cloud_off, size: 16, color: Colors.orange),
          SizedBox(width: 8),
          Text(
            'Modo offline: Datos locales', 
            style: TextStyle(fontSize: 12, color: Colors.orange, fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final estadoProveedores = ref.watch(proveedoresControllerProvider);
    final proveedoresFiltrados = ref.watch(proveedoresFiltradosProvider);
    final permisos = ref.watch(roleManagerProvider);
    final tema = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final tieneInternet = ref.watch(internetConnectionProvider).value ?? true;

    return Scaffold(
      backgroundColor: isDark ? tema.surface : Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Gestión de Proveedores', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            tooltip: 'Sincronizar ahora',
            icon: const Icon(Icons.cloud_sync_rounded),
            onPressed: tieneInternet ? _ejecutarSincronizacionTotal : null,
          ),
          const SizedBox(width: 8),
        ],
      ),
      floatingActionButton: permisos.puedeCrear
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NuevoProveedorPage())),
              icon: const Icon(Icons.add),
              label: const Text('Nuevo Proveedor'),
            )
          : null,
      body: Column(
        children: [
          // 1. Buscador
          BuscadorReutilizable<ProveedoresFilter>(
            filtroProvider: proveedoresFilterProvider,
            hintBusqueda: 'Nombre, RUC o teléfono...',
          ),

          // 2. Indicador de carga superior (Igual que en Clientes)
          if (estadoProveedores.isLoading)
            const LinearProgressIndicator(minHeight: 2)
          else
          const SizedBox(height: 2),
          // 3. Banner Offline (Consistencia visual)
          if (!tieneInternet) _construirBannerOffline(),
          const SizedBox(height: 10),
          _construirFiltros(tema, isDark, permisos.esAdministrador),

          // 4. Contenido Principal
          Expanded(
            child: estadoProveedores.when(
              skipLoadingOnReload: true, // ✅ Mantiene la lista mientras recarga
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => _construirVistaError(e),
              data: (_) => proveedoresFiltrados.isEmpty
                  ? _construirVistaVacia(tema)
                  : _construirListaProveedores(proveedoresFiltrados),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirFiltros(ColorScheme tema, bool isDark, bool esAdmin) {
    final filtro = ref.watch(proveedoresFilterProvider);
    if (!esAdmin) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: _dropdownEstado(tema, isDark, filtro),
    );
  }

  Widget _dropdownEstado(ColorScheme tema, bool isDark, ProveedoresFilter filtro) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? tema.surfaceContainer : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: tema.outlineVariant.withOpacity(0.5)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: filtro.soloActivos == true ? 'activos' : filtro.soloActivos == false ? 'inactivos' : 'todos',
          isExpanded: true,
          icon: Icon(Icons.filter_list, color: tema.primary, size: 20),
          items: const [
            DropdownMenuItem(value: 'todos', child: Text('Todos los proveedores')),
            DropdownMenuItem(value: 'activos', child: Text('Solo Activos')),
            DropdownMenuItem(value: 'inactivos', child: Text('Solo Inactivos')),
          ],
          onChanged: (val) {
            final notifier = ref.read(proveedoresFilterProvider.notifier);
            bool? soloActivos = val == 'todos' ? null : (val == 'activos');
            notifier.state = filtro.copyWith(soloActivos: soloActivos);
          },
        ),
      ),
    );
  }

  Widget _construirListaProveedores(List<ProveedorEntity> lista) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 80),
      itemCount: lista.length,
      separatorBuilder: (_, __) => const SizedBox(height: 4), // Separación mínima como en clientes
      itemBuilder: (_, i) {
        return ProveedorCard(
          proveedor: lista[i],
          showPendingBadge: lista[i].pendienteSync,
        );
      },
    );
  }

  Widget _construirVistaVacia(ColorScheme tema) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_off_outlined, size: 70, color: tema.outline.withOpacity(0.4)),
          const SizedBox(height: 16),
          const Text('No se encontraron proveedores'),
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