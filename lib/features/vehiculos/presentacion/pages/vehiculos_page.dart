import 'dart:async';
import 'package:banano_proyecto_app/core/connectivity/connectivity_service.dart';
import 'package:banano_proyecto_app/core/ui/widgets/buscador_reutilizable.dart';
import 'package:banano_proyecto_app/core/ui/widgets/mostrar_dialogos.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/di/vehiculos_filter_provider.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/vehiculo_card.dart';
import 'nuevo_vehiculo_page.dart';

class VehiculosPage extends ConsumerStatefulWidget {
  const VehiculosPage({super.key});

  @override
  ConsumerState<VehiculosPage> createState() => _VehiculosPageState();
}

class _VehiculosPageState extends ConsumerState<VehiculosPage> {
  late StreamSubscription<bool> _connectivitySubscription;
  final TextEditingController _buscadorController = TextEditingController();
  bool get hayInternet =>
      ref.read(internetConnectionProvider).valueOrNull ?? false;

  @override
  void initState() {
    super.initState();
    _configurarListenerConectividad();
    _inicializarBuscador();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refrescarAlEntrar();
  }

  @override
  void dispose() {
    _buscadorController.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // ──────────────────────────────
  // Configuración inicial
  // ──────────────────────────────

  void _configurarListenerConectividad() {
    _connectivitySubscription = ref
        .read(connectivityServiceProvider)
        .connectionStream
        .distinct()
        .listen((conectado) async {
          if (conectado) {
            await _sincronizarEnSegundoPlano();
          }
        });
  }

  void _inicializarBuscador() {
    final consultaInicial = ref.read(vehiculosFilterProvider).searchQuery;
    _buscadorController.text = consultaInicial;
  }

  void _refrescarAlEntrar() {
    Future.microtask(() {
      ref.read(vehiculosControllerProvider.notifier).cargar();
    });
  }

  // ──────────────────────────────
  // Sincronización
  // ──────────────────────────────
  Future<void> _sincronizarEnSegundoPlano() async {
    final outbox = ref.read(outboxRepositoryProvider);
    final pendientes = await outbox.pendientes(limit: 1);
    if (pendientes.isEmpty) return;

    try {
      await ref.read(syncServiceProvider).syncNow();
      await ref.read(vehiculosControllerProvider.notifier).cargar();

      if (mounted) {
        MensajesGlobales.info('¡Datos sincronizados automáticamente!');
      }
    } catch (e) {
      MensajesGlobales.error('Error al sincronizar datos automáticamente: $e');
    }
  }

  // ──────────────────────────────
  // Mensajes y feedback
  // ──────────────────────────────
  void _mostrarFeedbackGuardado() {
    final hayInternet =
        ref.read(internetConnectionProvider).valueOrNull ?? false;
    if (hayInternet) {
      MensajesGlobales.exito('Guardado correctamente');
    } else {
      MensajesGlobales.advertencia(
        'Guardado localmente. Se sincronizará cuando tengas internet.',
      );
    }
  }

  // ──────────────────────────────
  // Construcción de la UI
  // ──────────────────────────────
  @override
  Widget build(BuildContext context) {
    final vehiculosAsync = ref.watch(vehiculosControllerProvider);
    final roleManager = ref.watch(roleManagerProvider);
    final vehiculosFiltrados = ref.watch(vehiculosFiltradosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehículos'),
        centerTitle: false,
        actions: [_construirMenuEmergente(), const SizedBox(width: 8)],
      ),

      floatingActionButton: roleManager.puedeCrear
          ? FloatingActionButton.extended(
              onPressed: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NuevoVehiculoPage()),
                );
                if (resultado == true) {
                  ref.read(vehiculosControllerProvider.notifier).cargar();
                  _mostrarFeedbackGuardado();
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Nuevo vehículo'),
            )
          : null,

      body: Column(
        children: [
          _construirSeccionBusquedaYFiltros(),
          Expanded(
            child: vehiculosAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => _construirSeccionError(e),
              data: (_) {
                if (vehiculosFiltrados.isEmpty) {
                  return _construirSeccionVacia();
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
                  itemCount: vehiculosFiltrados.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (_, i) {
                    final v = vehiculosFiltrados[i];

                    return VehiculoCard(
                      v: v,
                      onEdit: roleManager.puedeEditar
                          ? () => _editarVehiculo(v)
                          : null,
                      onDelete: roleManager.puedeEliminar && !v.pendienteSync
                          ? () => _eliminarVehiculo(v)
                          : null,
                      showPendingBadge: v.pendienteSync,
                      esAdministrador: roleManager.esAdministrador,
                      onReactivar: roleManager.esAdministrador && !v.activo
                          ? () async {
                              final confirmar = await Dialogos.confirmar(
                                context: context,
                                titulo: 'Reactivar vehículo',
                                contenido:
                                    '¿Desea reactivar "${v.nombre}" (${v.placa})?\n\nEl estado cambiará a "Operativo".',
                                icono: Icons.restore,
                                textoConfirmar: 'Reactivar',
                                colorConfirmar: Colors.green.shade600,
                              );

                              if (confirmar != true) return;

                              await ref
                                  .read(vehiculosControllerProvider.notifier)
                                  .reactivar(v.idExterno);
                            }
                          : null,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────
  // Métodos de acciones (editar/eliminar)
  // ──────────────────────────────

  Future<void> _editarVehiculo(VehiculoEntity v) async {
    final confirmar = await Dialogos.confirmarEditar(
      context: context,
      nombre: v.nombre,
      placa: v.placa,
      hayInternet: hayInternet,
    );

    if (confirmar != true) return;

    final modificado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NuevoVehiculoPage(editar: v)),
    );

    if (modificado == true) {
      ref.read(vehiculosControllerProvider.notifier).cargar();
      _mostrarFeedbackGuardado();
    }
  }

  Future<void> _eliminarVehiculo(VehiculoEntity v) async {
    final confirmar = await Dialogos.confirmarEliminar(
      context: context,
      nombre: v.nombre,
      placa: v.placa,
    );
    
    if (confirmar != true) return;

    await ref.read(vehiculosControllerProvider.notifier).eliminar(v.idExterno);

    if (hayInternet) {
      MensajesGlobales.exito('Vehículo eliminado correctamente.');
    } else {
      MensajesGlobales.advertencia(
        'Vehículo eliminado localmente. Se sincronizará cuando tengas internet.',
      );
    }
  }


  // ──────────────────────────────
  // UI reutilizable
  // ──────────────────────────────

  PopupMenuButton<_MenuAccion> _construirMenuEmergente() {
    return PopupMenuButton<_MenuAccion>(
      icon: const Icon(Icons.more_vert),
      onSelected: (accion) async {
        switch (accion) {
          case _MenuAccion.actualizar:
            await ref.read(vehiculosControllerProvider.notifier).cargar();
            break;
          case _MenuAccion.sincronizar:
            if (!hayInternet) {
              MensajesGlobales.advertencia(
                'No hay conexión a internet para sincronizar.',
              );
              return;
            }

            final scaffold = ScaffoldMessenger.of(context);
            scaffold.showSnackBar(
              const SnackBar(
                content: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text('Sincronizando datos pendientes...'),
                  ],
                ),
                duration: Duration(seconds: 5),
              ),
            );

            try {
              await ref.read(syncServiceProvider).syncNow();
              await ref.read(vehiculosControllerProvider.notifier).cargar();

              scaffold.hideCurrentSnackBar();
              MensajesGlobales.exito(
                '¡Sincronización completada exitosamente!',
              );
            } on DioException {
              scaffold.hideCurrentSnackBar();
              MensajesGlobales.error(
                'No se pudo conectar al servidor. Conéctate a internet e intenta de nuevo.',
              );
            } catch (e) {
              scaffold.hideCurrentSnackBar();
              MensajesGlobales.error(
                'Ocurrió un error durante la sincronización: $e',
              );
            }
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: _MenuAccion.actualizar,
          child: Row(
            children: [
              Icon(Icons.refresh, size: 20),
              SizedBox(width: 12),
              Text('Actualizar lista'),
            ],
          ),
        ),
        PopupMenuItem<_MenuAccion>(
          value: _MenuAccion.sincronizar,
          enabled: hayInternet,
          child: Row(
            children: [
              Icon(
                Icons.sync,
                size: 20,
                color: hayInternet ? null : Colors.grey,
              ),
              SizedBox(width: 12),
              Text(
                'Sincronizar todo',
                style: TextStyle(color: hayInternet ? null : Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _construirSeccionBusquedaYFiltros() {
  final roleManager = ref.watch(roleManagerProvider);
  final esAdministrador = roleManager.esAdministrador;

  final filtroActual = ref.watch(vehiculosFilterProvider);
  final notifier = ref.read(vehiculosFilterProvider.notifier);

  final bool switchHabilitado =
      esAdministrador &&
      filtroActual.estadoFiltro != 'Operativo' &&
      filtroActual.estadoFiltro != 'Fuera de servicio';

  return Column(
    children: [
      // SOLO EL BUSCADOR
      BuscadorReutilizable<VehiculosFilter>(
        filtroProvider: vehiculosFilterProvider,
        hintBusqueda: 'Buscar por placa, nombre, marca, conductor...',
      ),

      // FILTROS DEBAJO
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                initialValue: filtroActual.estadoFiltro,
                hint: const Text('Todos los estados'),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                items: [
                  const DropdownMenuItem(value: null, child: Text('Todos los estados')),
                  const DropdownMenuItem(value: 'Operativo', child: Text('Operativo')),
                  const DropdownMenuItem(value: 'En mantenimiento', child: Text('En mantenimiento')),
                  if (esAdministrador)
                    const DropdownMenuItem(value: 'Fuera de servicio', child: Text('Fuera de servicio')),
                ],
                onChanged: (value) {
                  if (value == null) {
                  notifier.state = VehiculosFilter(
                    searchQuery: '',
                    estadoFiltro: null,
                    soloActivos: false,
                  );
                } else {
                  bool nuevoSoloActivos = notifier.state.soloActivos;

                  if (value == 'Operativo') {
                    nuevoSoloActivos = true;
                  } else if (value == 'Fuera de servicio') {
                    nuevoSoloActivos = false;
                  }

                  notifier.state = notifier.state.copyWith(
                    estadoFiltro: value,
                    soloActivos: nuevoSoloActivos,
                  );
                }
                },
              ),
            ),
            const SizedBox(width: 12),
            if (esAdministrador)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    const Text('Solo activos', style: TextStyle(fontSize: 14)),
                    Switch(
                      value: filtroActual.soloActivos,
                      onChanged: switchHabilitado ? (v) => notifier.state = notifier.state.copyWith(soloActivos: v) : null,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    ],
  );
}

  Widget _construirSeccionError(Object e) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error al cargar vehículos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(e.toString(), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () =>
                  ref.read(vehiculosControllerProvider.notifier).cargar(),
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirSeccionVacia() {
    final filtro = ref.watch(vehiculosFilterProvider);

    final bool tieneFiltrosActivos =
        filtro.searchQuery.isNotEmpty ||
        filtro.estadoFiltro != null ||
        !filtro.soloActivos;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.directions_car_outlined,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 24),
            Text(
              tieneFiltrosActivos
                  ? 'No se encontraron vehículos con los filtros aplicados'
                  : 'No tienes vehículos registrados',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            if (tieneFiltrosActivos)
              Text(
                'Prueba cambiando los filtros o el texto de búsqueda',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

enum _MenuAccion { actualizar, sincronizar }
