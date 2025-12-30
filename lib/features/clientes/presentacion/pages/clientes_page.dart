import 'dart:async';
import 'package:banano_proyecto_app/core/connectivity/connectivity_service.dart';
import 'package:banano_proyecto_app/core/ui/widgets/buscador_reutilizable.dart';
import 'package:banano_proyecto_app/core/ui/widgets/mostrar_dialogos.dart';
import 'package:banano_proyecto_app/core/utils/debug_database.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/di/clientes_filter_provider.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/clientes/presentacion/widgets/clientes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'nuevo_cliente_page.dart';

class ClientesPage extends ConsumerStatefulWidget {
  const ClientesPage({super.key});
  @override
  ConsumerState<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends ConsumerState<ClientesPage> {
  late StreamSubscription<bool> _connectivitySubscription;

  bool get _hayInternet =>
      ref.read(internetConnectionProvider).valueOrNull ?? false;

  @override
  void initState() {
    super.initState();
    _configurarListenerConectividad();
    DebugDatabase.imprimirRegistros(ref.read(isarProvider));
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

  // ==================== BUILD PRINCIPAL ====================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: _construirAppBar(),
      floatingActionButton: _construirbotonflotante(),
      body: Column(
        children: [
          _construirBuscador(),
          _construirFiltroEstado(),
          _construirListaClientes(),
        ],
      ),
    );
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
    Future.microtask(
      () => ref.read(clientesControllerProvider.notifier).cargar(),
    );
  }

  Future<void> _sincronizarEnSegundoPlano() async {
    final outbox = ref.read(outboxRepositoryProvider);
    final pendientes = await outbox.pendientes(limit: 1);
    if (pendientes.isEmpty) return;

    try {
      await ref.read(syncServiceProvider).syncNow();
      await ref.read(clientesControllerProvider.notifier).cargar();
      if (mounted) {
        MensajesGlobales.info('¡Datos sincronizados automáticamente!');
      }
    } catch (e) {
      MensajesGlobales.error('Error al sincronizar datos automáticamente: $e');
    }
  }

  // ==================== NAVEGACIÓN ====================

  Future<void> _navegarFormulario({ClienteEntity? cliente}) async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NuevoClientePage(editar: cliente)),
    );

    if (resultado == true) {
      ref.read(clientesControllerProvider.notifier).cargar();
      MensajesGlobales.exito(
        cliente == null ? 'Cliente creado' : 'Cliente actualizado',
      );
    }
  }

  Future<void> _eliminarCliente(ClienteEntity c) async {
    final confirmar = await Dialogos.confirmarEliminar(
      context: context,
      nombre: c.nombre,
      placa: c.rucCi ?? 'Sin RUC/CI',
    );

    if (confirmar != true) return;

    await ref.read(clientesControllerProvider.notifier).eliminar(c.idExterno);

    if (_hayInternet) {
      MensajesGlobales.exito('Cliente eliminado correctamente.');
    } else {
      MensajesGlobales.advertencia(
        'Cliente eliminado localmente. Se sincronizará cuando tengas internet.',
      );
    }
  }

  // ==================== UI WIDGETS ====================

  PreferredSizeWidget _construirAppBar() {
    return AppBar(
      title: const Text(
        'Gestión de Clientes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        // BOTÓN DE REFRESH (CARGAR)
        IconButton(
          icon: const Icon(Icons.refresh),
          tooltip: 'Actualizar lista',
          onPressed: () => ref.read(clientesControllerProvider.notifier).cargar(),
        ),
      ],
    );
  }

  Widget _construirbotonflotante() {
    final roleManager = ref.watch(roleManagerProvider);
    if (!roleManager.puedeCrear) return const SizedBox.shrink();

    return FloatingActionButton.extended(
      onPressed: _navegarFormulario,
      icon: const Icon(Icons.add),
      label: const Text('Nuevo cliente'),
    );
  }

  Widget _construirBuscador() {
    return BuscadorReutilizable<ClientesFilter>(
      filtroProvider: clientesFilterProvider,
      hintBusqueda: 'Buscar por nombre, RUC, teléfono...',
    );
  }

  Widget _construirFiltroEstado() {
    final roleManager = ref.watch(roleManagerProvider);
    if (!roleManager.esAdministrador) return const SizedBox.shrink();

    final filtroActual = ref.watch(clientesFilterProvider);
    final notifier = ref.read(clientesFilterProvider.notifier);

    String valorActual = filtroActual.soloActivos == true
        ? 'activos'
        : filtroActual.soloActivos == false
        ? 'inactivos'
        : 'todos';

    void limpiarFiltros() {
      notifier.state = ClientesFilter(
        searchQuery: '',
        soloActivos: null, // ← Crucial: null para mostrar todos
        provincia: null,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título + Limpiar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filtrar por estado',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.indigo,
                ),
              ),
              TextButton.icon(
                onPressed: limpiarFiltros,
                icon: const Icon(Icons.clear_all, size: 18),
                label: const Text('Limpiar', style: TextStyle(fontSize: 13)),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),

          // Dropdown con opciones
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              value: valorActual,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.indigo,
                size: 28,
              ),
              elevation: 8,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(20),
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'todos',
                  child: Row(
                    children: [
                      Icon(Icons.people, color: Colors.blue, size: 20),
                      SizedBox(width: 10),
                      Text('Todos los clientes'),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'activos',
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 20),
                      SizedBox(width: 10),
                      Text('Solo clientes activos'),
                    ],
                  ),
                ),
                DropdownMenuItem(
                  value: 'inactivos',
                  child: Row(
                    children: [
                      Icon(Icons.cancel, color: Colors.red, size: 20),
                      SizedBox(width: 10),
                      Text('Solo clientes inactivos'),
                    ],
                  ),
                ),
              ],
              onChanged: (value) {
                switch (value) {
                  case 'activos':
                    notifier.state = notifier.state.copyWith(soloActivos: true);
                    break;
                  case 'inactivos':
                    notifier.state = notifier.state.copyWith(
                      soloActivos: false,
                    );
                    break;
                  case 'todos':
                  default:
                    notifier.state = ClientesFilter(
                      searchQuery: '',
                      soloActivos: null,
                      provincia: null,
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirListaClientes() {
    final clientesAsync = ref.watch(clientesControllerProvider);
    final roleManager = ref.watch(roleManagerProvider);
    final clientesFiltrados = ref.watch(clientesFiltradosProvider);

    return Expanded(
      child: clientesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _construirErrorSection(e),
        data: (_) {
          if (clientesFiltrados.isEmpty) {
            return _construirEmptySection();
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
            itemCount: clientesFiltrados.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final c = clientesFiltrados[i];

              return ClienteCard(
                cliente: c,
                onEdit: roleManager.puedeEditar
                    ? () => _navegarFormulario(cliente: c)
                    : null,
                onDelete: roleManager.puedeEliminar && !c.pendienteSync
                    ? () => _eliminarCliente(c)
                    : null,
                esAdministrador: roleManager.esAdministrador,
                showPendingBadge: c.pendienteSync,
                onReactivar: roleManager.esAdministrador && !c.activo
                    ? () => _reactivarCliente(c)
                    : null,
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _reactivarCliente(ClienteEntity c) async {
    final confirmar = await Dialogos.confirmar(
      context: context,
      titulo: 'Reactivar Cliente',
      contenido: '¿Estás seguro de reactivar al cliente "${c.nombre}"?',
      textoConfirmar: 'Reactivar',
      colorConfirmar: Colors.green.shade600,
    );

    if (confirmar == true) {
      await ref
          .read(clientesControllerProvider.notifier)
          .reactivar(c.idExterno);
      MensajesGlobales.exito('Cliente reactivado correctamente');
    }
  }

  Widget _construirErrorSection(Object e) {
    return Center(child: Text('Error: $e'));
  }

  Widget _construirEmptySection() {
    return const Center(child: Text('No hay clientes registrados'));
  }
}
