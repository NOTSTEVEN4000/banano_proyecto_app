// lib/features/proveedores/presentacion/pages/proveedores_page.dart

import 'dart:async';

import 'package:banano_proyecto_app/core/connectivity/connectivity_service.dart';
import 'package:banano_proyecto_app/core/ui/widgets/buscador_reutilizable.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/di/proveedor_filter_providert.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/proveedores/presentacion/widgets/proveedor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'nuevo_proveedor_page.dart';

class ProveedoresPage extends ConsumerStatefulWidget {
  const ProveedoresPage({super.key});

  @override
  ConsumerState<ProveedoresPage> createState() => _ProveedoresPageState();
}

class _ProveedoresPageState extends ConsumerState<ProveedoresPage> {
  late StreamSubscription<bool> _connectivitySubscription;
  bool get hayInternet => ref.read(internetConnectionProvider).valueOrNull ?? false;

  @override
  void initState() {
    super.initState();
    _configurarListenerConectividad();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refrescarAlEntrar();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }


  // ==================== CONFIGURACIÓN ====================

  void _configurarListenerConectividad() {
    _connectivitySubscription = ref
        .read(connectivityServiceProvider)
        .connectionStream
        .distinct()
        .listen((conectado) async {
      if (conectado) await _sincronizarEnSegundoPlano();
    });
  }

  void _refrescarAlEntrar() {
    Future.microtask(() => ref.read(proveedoresControllerProvider.notifier).cargar());
  }

  Future<void> _sincronizarEnSegundoPlano() async {
    final outbox = ref.read(outboxRepositoryProvider);
    final pendientes = await outbox.pendientes(limit: 1);
    if (pendientes.isEmpty) return;

    try {
      await ref.read(syncServiceProvider).syncNow();
      await ref.read(proveedoresControllerProvider.notifier).cargar();
      if (mounted) {
        MensajesGlobales.info('¡Datos sincronizados automáticamente!');
      }
    } catch (e) {
      MensajesGlobales.error('Error al sincronizar datos automáticamente: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final proveedoresAsync = ref.watch(proveedoresControllerProvider);
    final roleManager = ref.watch(roleManagerProvider);
    final esAdministrador = roleManager.esAdministrador;
    final proveedoresFiltrados = ref.watch(proveedoresFiltradosProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Proveedores', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Actualizar lista',
            onPressed: () => ref.read(proveedoresControllerProvider.notifier).cargar(),
          ),
        ],
      ),
      floatingActionButton: roleManager.puedeCrear
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NuevoProveedorPage(),
                  ),
                ).then((resultado) {
                  if (resultado == true) {
                    ref.read(proveedoresControllerProvider.notifier).cargar();
                  }
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Nuevo proveedor'),
            )
          : const SizedBox.shrink(),
      body: Column(
        children: [
          BuscadorReutilizable<ProveedoresFilter>(
            filtroProvider: proveedoresFilterProvider,
            hintBusqueda: 'Buscar por nombre, RUC, teléfono...',
          ),
          if (esAdministrador) _construirFiltroEstado(),
          Expanded(
            child: proveedoresAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (_) {
                if (proveedoresFiltrados.isEmpty) {
                  return const Center(child: Text('No hay proveedores registrados'));
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
                  itemCount: proveedoresFiltrados.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final p = proveedoresFiltrados[i];
                    return ProveedorCard(proveedor: p);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirFiltroEstado() {
    final filtroActual = ref.watch(proveedoresFilterProvider);
    final notifier = ref.read(proveedoresFilterProvider.notifier);

    String valorActual = filtroActual.soloActivos == true
        ? 'activos'
        : filtroActual.soloActivos == false
            ? 'inactivos'
            : 'todos';

    void limpiarFiltros() {
      notifier.state = ProveedoresFilter(searchQuery: '', soloActivos: null);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filtrar por estado',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.indigo),
              ),
              TextButton.icon(
                onPressed: limpiarFiltros,
                icon: const Icon(Icons.clear_all, size: 18),
                label: const Text('Limpiar', style: TextStyle(fontSize: 13)),
                style: TextButton.styleFrom(foregroundColor: Colors.red.shade600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(color: Colors.grey.withValues(alpha: 0.15), blurRadius: 8, offset: const Offset(0, 4)),
              ],
            ),
            child: DropdownButtonFormField<String>(
              initialValue: valorActual,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.indigo, size: 28),
              elevation: 8,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'todos', child: Row(children: [Icon(Icons.people, color: Colors.blue, size: 20), SizedBox(width: 10), Text('Todos los proveedores')])),
                DropdownMenuItem(value: 'activos', child: Row(children: [Icon(Icons.check_circle, color: Colors.green, size: 20), SizedBox(width: 10), Text('Solo activos')])),
                DropdownMenuItem(value: 'inactivos', child: Row(children: [Icon(Icons.cancel, color: Colors.red, size: 20), SizedBox(width: 10), Text('Solo inactivos')])),
              ],
              onChanged: (value) {
                switch (value) {
                  case 'activos':
                    notifier.state = notifier.state.copyWith(soloActivos: true);
                    break;
                  case 'inactivos':
                    notifier.state = notifier.state.copyWith(soloActivos: false);
                    break;
                  case 'todos':
                  default:
                    notifier.state = ProveedoresFilter(searchQuery: '', soloActivos: null, provincia: null);
                }
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}