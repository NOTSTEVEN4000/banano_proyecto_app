import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importaciones de núcleo y servicios
import 'package:banano_proyecto_app/core/connectivity/connectivity_service.dart';
import 'package:banano_proyecto_app/core/ui/widgets/buscador_reutilizable.dart';
import 'package:banano_proyecto_app/core/ui/widgets/mostrar_dialogos.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';

// Inyección de dependencias y estados
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/di/vehiculos_filter_provider.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';

// Widgets locales y navegación
import '../widgets/vehiculo_card.dart';
import 'nuevo_vehiculo_page.dart';

class VehiculosPage extends ConsumerStatefulWidget {
  const VehiculosPage({super.key});

  @override
  ConsumerState<VehiculosPage> createState() => _VehiculosPageState();
}

class _VehiculosPageState extends ConsumerState<VehiculosPage> {
  late StreamSubscription<bool> _subscripcionConectividad;

  // Helper para verificar conexión rápidamente
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

  // ─────────────────────────────────────────────────────────────
  // LÓGICA DE INICIALIZACIÓN
  // ─────────────────────────────────────────────────────────────

  void _inicializarPagina() {
    // 1. Limpiar filtros al entrar (Estado fresco)
    Future.microtask(() {
      if (mounted) {
        ref.read(vehiculosFilterProvider.notifier).state = VehiculosFilter();
        _cargarDatos();
      }
    });

    // 2. Configurar escucha de internet
    _configurarEscuchaConectividad();

    // 3. Debug (Opcional)
    _verificarEstadoTareasPendientes();
  }

  void _configurarEscuchaConectividad() {
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
    await ref.read(vehiculosControllerProvider.notifier).cargar();
  }

  // ─────────────────────────────────────────────────────────────
  // LÓGICA DE NEGOCIO Y SINCRONIZACIÓN
  // ─────────────────────────────────────────────────────────────

  Future<void> _intentarSincronizacionAutomatica() async {
    final outbox = ref.read(outboxRepositoryProvider);
    final pendientes = await outbox.pendientes(limit: 1);

    if (pendientes.isEmpty) return;

    try {
      await ref.read(syncServiceProvider).syncNow();
      await _cargarDatos();

      if (mounted) {
        MensajesGlobales.exito('Datos sincronizados correctamente');
      }
    } catch (e) {
      _manejarErrorSincronizacion(e, pendientes.first.idOperacion);
    }
  }

  Future<void> _manejarErrorSincronizacion(Object e, String idTarea) async {
    debugPrint('Error sincronizando: $e');

    // Si el registro no existe en el servidor (404), limpiamos la cola para no bloquear
    if (e is DioException && e.response?.statusCode == 404) {
      await ref.read(outboxRepositoryProvider).eliminarTareaPorId(idTarea);
      _intentarSincronizacionAutomatica(); // Reintentar con el siguiente
    }
  }

  void _darFeedbackSegunConexion() {
    if (_hayInternet) {
      MensajesGlobales.exito('Operación realizada con éxito');
    } else {
      MensajesGlobales.advertencia(
        'Guardado en el dispositivo. Se subirá al recuperar internet.',
      );
    }
  }

  // ─────────────────────────────────────────────────────────────
  // ACCIONES DE USUARIO
  // ─────────────────────────────────────────────────────────────

  Future<void> _navegarANuevoVehiculo() async {
    final guardado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NuevoVehiculoPage()),
    );

    if (guardado == true && mounted) {
      await _cargarDatos();
      _darFeedbackSegunConexion();
    }
  }

  Future<void> _editarVehiculo(VehiculoEntity vehiculo) async {
    final confirmar = await Dialogos.confirmarEditar(
      context: context,
      nombre: vehiculo.nombre,
      placa: vehiculo.placa,
      hayInternet: _hayInternet,
    );

    if (confirmar != true) return;

    final editado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NuevoVehiculoPage(editar: vehiculo)),
    );

    if (editado == true && mounted) {
      await _cargarDatos();
      _darFeedbackSegunConexion();
    }
  }

  Future<void> _eliminarVehiculo(VehiculoEntity vehiculo) async {
    final confirmar = await Dialogos.confirmarEliminar(
      context: context,
      nombre: vehiculo.nombre,
      placa: vehiculo.placa,
    );

    if (confirmar != true) return;

    await ref
        .read(vehiculosControllerProvider.notifier)
        .eliminar(vehiculo.idExterno);
    _darFeedbackSegunConexion();
  }

  Future<void> _reactivarVehiculo(VehiculoEntity vehiculo) async {
    final confirmar = await Dialogos.confirmar(
      context: context,
      titulo: 'Reactivar vehículo',
      contenido:
          '¿Desea reactivar "${vehiculo.nombre}"?\nEl estado pasará a "Operativo".',
      icono: Icons.restore,
      textoConfirmar: 'Reactivar',
      colorConfirmar: Colors.green,
    );

    if (confirmar == true) {
      await ref
          .read(vehiculosControllerProvider.notifier)
          .reactivar(vehiculo.idExterno);
      _cargarDatos();
    }
  }

  // ─────────────────────────────────────────────────────────────
  // CONSTRUCCIÓN DE UI (WIDGETS SECCIONADOS)
  // ─────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final estadoVehiculos = ref.watch(vehiculosControllerProvider);
    final vehiculosFiltrados = ref.watch(vehiculosFiltradosProvider);
    final permisos = ref.watch(roleManagerProvider);
    final tema = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Vehículos'),
        centerTitle: false,
        actions: [
          IconButton(
            tooltip: 'Sincronizar datos',
            icon: Icon(
              Icons.cloud_sync_rounded,
              color: _hayInternet
                  ? tema.primary
                  : tema.outline.withOpacity(0.5),
            ),
            onPressed: _hayInternet
                ? _ejecutarSincronizacionTotal
                : () => MensajesGlobales.advertencia(
                    'Requiere conexión a internet',
                  ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      floatingActionButton: permisos.puedeCrear
          ? FloatingActionButton.extended(
              onPressed: _navegarANuevoVehiculo,
              backgroundColor: tema.primary,
              foregroundColor: tema.onPrimary,
              icon: const Icon(Icons.add),
              label: const Text('Nuevo Vehículo'),
            )
          : null,

      body: Column(
        children: [
          _construirFiltros(tema, permisos.esAdministrador),
          Expanded(
            child: estadoVehiculos.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => _construirVistaError(e),
              data: (_) => vehiculosFiltrados.isEmpty
                  ? _construirVistaVacia(tema)
                  : _construirListaVehiculos(vehiculosFiltrados, permisos),
            ),
          ),
        ],
      ),
    );
  }

  void _limpiarFiltros() {
    ref.read(vehiculosFilterProvider.notifier).state = VehiculosFilter();
    MensajesGlobales.info('Filtros restablecidos');
  }

  Widget _construirFiltros(ColorScheme tema, bool esAdmin) {
    final filtro = ref.watch(vehiculosFilterProvider);
    // Verificamos si hay algo que limpiar para mostrar/ocultar el botón
    final tieneFiltrosActivos =
        filtro.searchQuery.isNotEmpty || filtro.estadoFiltro != 'Operativo';

    return Column(
      children: [
        BuscadorReutilizable<VehiculosFilter>(
          filtroProvider: vehiculosFilterProvider,
          hintBusqueda: 'Placa, nombre, marca o conductor...',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Row(
            children: [
              // Dropdown expandido para ocupar el espacio
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: filtro.estadoFiltro,
                  decoration: _estiloInputFiltro(
                    tema,
                    Icons.filter_alt_outlined,
                  ),
                  items: [
                    const DropdownMenuItem(
                      value: 'Operativo',
                      child: Text('Operativos'),
                    ),
                    const DropdownMenuItem(
                      value: 'En mantenimiento',
                      child: Text('En Mantenimiento'),
                    ),
                    if (esAdmin)
                      const DropdownMenuItem(
                        value: 'Fuera de servicio',
                        child: Text('Inactivos'),
                      ),
                  ],
                  onChanged: (val) {
                    if (val != null) {
                      ref.read(vehiculosFilterProvider.notifier).state = filtro
                          .copyWith(estadoFiltro: val);
                    }
                  },
                ),
              ),

              // BOTÓN DE LIMPIAR
              if (tieneFiltrosActivos) ...[
                const SizedBox(width: 8),
                IconButton.filledTonal(
                  onPressed: _limpiarFiltros,
                  tooltip: 'Limpiar filtros',
                  icon: const Icon(Icons.filter_alt_off_rounded),
                  style: IconButton.styleFrom(
                    // ignore: deprecated_member_use
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

  Widget _construirListaVehiculos(
    List<VehiculoEntity> lista,
    dynamic permisos,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 80),
      itemCount: lista.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) {
        final v = lista[i];
        return VehiculoCard(
          v: v,
          onEdit: permisos.puedeEditar ? () => _editarVehiculo(v) : null,
          onDelete: (permisos.puedeEliminar && !v.pendienteSync)
              ? () => _eliminarVehiculo(v)
              : null,
          showPendingBadge: v.pendienteSync,
          esAdministrador: permisos.esAdministrador,
          onReactivar: (permisos.esAdministrador && !v.activo)
              ? () => _reactivarVehiculo(v)
              : null,
        );
      },
    );
  }

  // ─────────────────────────────────────────────────────────────
  // COMPONENTES DE SOPORTE (UI PEQUEÑA)
  // ─────────────────────────────────────────────────────────────

  Future<void> _ejecutarSincronizacionTotal() async {
    // 1. Feedback visual inmediato
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sincronizando con el servidor...'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );

    try {
      // 2. PASO 1: Subir datos locales al servidor (Outbox)
      // Esto procesa las tareas pendientes de creación, edición o eliminación
      await ref.read(syncServiceProvider).syncNow();

      // 3. PASO 2: Descargar la lista actualizada de la Base de Datos
      // Al llamar a cargar(), el controller traerá los datos frescos del servidor
      await ref.read(vehiculosControllerProvider.notifier).cargar();

      if (mounted) {
        MensajesGlobales.exito('Sincronización exitosa');
      }
    } catch (e) {
      debugPrint('Error en Sincronización Total: $e');

      // Manejo específico si una tarea está rota (ej. 404) para no bloquear la lista
      if (e is DioException && e.response?.statusCode == 404) {
        // Opcional: podrías limpiar la tarea corrupta aquí
      }

      if (mounted) {
        MensajesGlobales.error(
          'Hubo un problema al sincronizar algunos datos.',
        );
        // Intentamos al menos cargar lo que haya en local
        ref.read(vehiculosControllerProvider.notifier).cargar();
      }
    }
  }

  InputDecoration _estiloInputFiltro(ColorScheme tema, IconData icono) {
    return InputDecoration(
      prefixIcon: Icon(icono, color: tema.primary),
      filled: true,
      fillColor: tema.surfaceContainerHighest.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _construirVistaVacia(ColorScheme tema) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_car_filled_outlined,
            size: 70,
            color: tema.outline.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'No se encontraron vehículos',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
          const Icon(Icons.wifi_off_rounded, size: 50, color: Colors.orange),
          const SizedBox(height: 16),
          Text('Error de carga: $error', textAlign: TextAlign.center),
          TextButton(onPressed: _cargarDatos, child: const Text('Reintentar')),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────
  // DEBUG
  // ─────────────────────────────────────────────────────────────

  Future<void> _verificarEstadoTareasPendientes() async {
    final outbox = ref.read(outboxRepositoryProvider);
    final pendientes = await outbox.pendientes(limit: 5);
    debugPrint('--- [INFO] Tareas en Outbox: ${pendientes.length} ---');
  }
}
