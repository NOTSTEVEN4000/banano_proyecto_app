import 'dart:async';
import 'package:banano_proyecto_app/core/connectivity/connectivity_service.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'vehiculo_card.dart';
import 'nuevo_vehiculo_page.dart';

class VehiculosPage extends ConsumerStatefulWidget {
  const VehiculosPage({super.key});

  @override
  ConsumerState<VehiculosPage> createState() => _VehiculosPageState();
}

class _VehiculosPageState extends ConsumerState<VehiculosPage> {
  late StreamSubscription<bool> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    // Sincronización automática cuando vuelve internet
    _connectivitySubscription = ref
        .read(connectivityServiceProvider)
        .connectionStream
        .distinct()
        .listen((connected) async {
      if (connected) {
        await _sincronizarEnSegundoPlano();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Refresca cada vez que la pantalla se vuelve visible (entrar o volver)
    Future.microtask(() {
      ref.read(vehiculosControllerProvider.notifier).cargar();
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _sincronizarEnSegundoPlano() async {
    final outbox = ref.read(outboxRepositoryProvider);
    final pendientes = await outbox.pendientes(limit: 1);
    if (pendientes.isEmpty) return;

    try {
      await ref.read(syncServiceProvider).syncNow();
      await ref.read(vehiculosControllerProvider.notifier).cargar();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Datos sincronizados automáticamente!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      // Silencioso
    }
  }

  void _mostrarFeedbackGuardado(bool hayInternet) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          hayInternet
              ? 'Guardado correctamente'
              : 'Guardado localmente. Se sincronizará cuando tengas internet.',
        ),
        backgroundColor: hayInternet ? Colors.green : Colors.orange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vehiculosAsync = ref.watch(vehiculosControllerProvider);
    final connectionAsync = ref.watch(internetConnectionProvider);
    final roleManager = ref.watch(roleManagerProvider); // ← Usamos RoleManager

    final bool hayInternet = connectionAsync.valueOrNull ?? false;

    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Vehículos'),
        centerTitle: false,
        actions: [
          PopupMenuButton<_MenuAccion>(
            icon: const Icon(Icons.more_vert),
            onSelected: (accion) async {
              switch (accion) {
                case _MenuAccion.actualizar:
                  await ref.read(vehiculosControllerProvider.notifier).cargar();
                  break;

                case _MenuAccion.sincronizar:
                  if (!hayInternet) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No hay conexión a internet para sincronizar.'),
                        backgroundColor: Colors.orange,
                        duration: Duration(seconds: 5),
                      ),
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
                      duration: Duration(seconds: 10),
                    ),
                  );

                  try {
                    await ref.read(syncServiceProvider).syncNow();
                    await ref.read(vehiculosControllerProvider.notifier).cargar();

                    scaffold.hideCurrentSnackBar();
                    scaffold.showSnackBar(
                      const SnackBar(
                        content: Text('¡Sincronización completada exitosamente!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 4),
                      ),
                    );
                  } on DioException {
                    scaffold.hideCurrentSnackBar();
                    scaffold.showSnackBar(
                      const SnackBar(
                        content: Text('No se pudo conectar al servidor. Conectate a internet e intenta de nuevo.'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 6),
                      ),
                    );
                  } catch (e) {
                    scaffold.hideCurrentSnackBar();
                    scaffold.showSnackBar(
                      SnackBar(
                        content: Text('Error al sincronizar: $e'),
                        backgroundColor: Colors.red,
                      ),
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
                    const SizedBox(width: 12),
                    Text(
                      'Sincronizar todo',
                      style: TextStyle(color: hayInternet ? null : Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
        
      ),

      // FAB: ambos roles pueden crear
      floatingActionButton: roleManager.puedeCrear
          ? FloatingActionButton.extended(
              onPressed: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NuevoVehiculoPage()),
                );
                if (resultado == true) {
                  ref.read(vehiculosControllerProvider.notifier).cargar();
                  _mostrarFeedbackGuardado(hayInternet);
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Nuevo vehículo'),
            )
          : null,


      body: vehiculosAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
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
                  onPressed: () => ref.read(vehiculosControllerProvider.notifier).cargar(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.directions_car_outlined, size: 80, color: Colors.grey[400]),
                    const SizedBox(height: 24),
                    Text(
                      'No tienes vehículos registrados',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Presiona el botón + para agregar uno nuevo',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (_, i) {
              final v = items[i];

              return VehiculoCard(
                v: v,
                // EDITAR: ambos roles pueden editar (local o sincronizado)
                onEdit: roleManager.puedeEditar ? () async {
                  final confirmar = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Editar vehículo'),
                      content: Text(
                        '¿Estás seguro de editar "${v.nombre}" (${v.placa})?\n\n'
                        '${!hayInternet ? "Se guardará localmente y se sincronizará después." : "Los cambios se guardarán inmediatamente."}',
                      ),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
                        TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Editar')),
                      ],
                    ),
                  );

                  if (confirmar != true) return;

                  final modificado = await Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(builder: (_) => NuevoVehiculoPage(editar: v)),
                  );

                  if (modificado == true) {
                    ref.read(vehiculosControllerProvider.notifier).cargar();
                    _mostrarFeedbackGuardado(hayInternet);
                  }
                } : null,

                // ELIMINAR: solo admin y solo si está sincronizado (no pendiente)
                onDelete: roleManager.puedeEliminar && !v.pendienteSync ? () async {
                  final confirmar = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Eliminar vehículo'),
                      content: Text('¿Estás seguro de eliminar "${v.nombre}" (${v.placa})?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          style: TextButton.styleFrom(foregroundColor: Colors.red),
                          child: const Text('Eliminar'),
                        ),
                      ],
                    ),
                  );

                  if (confirmar != true) return;

                  await ref.read(vehiculosControllerProvider.notifier).eliminar(v.idExterno);

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        hayInternet
                            ? 'Vehículo eliminado'
                            : 'Vehículo eliminado localmente. Se sincronizará cuando tengas internet.',
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                } : null,

                showPendingBadge: v.pendienteSync,
                esAdministrador: roleManager.esAdministrador,
              );
            },
          );
        },
        
      ),
      
    );
  }
}


enum _MenuAccion {
  actualizar,
  sincronizar,
}