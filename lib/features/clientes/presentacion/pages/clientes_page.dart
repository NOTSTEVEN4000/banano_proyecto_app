import 'dart:async';
import 'package:banano_proyecto_app/core/connectivity/connectivity_service.dart';
import 'package:banano_proyecto_app/core/ui/widgets/buscador_reutilizable.dart';
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
  final ScrollController _scrollController = ScrollController();

  bool get hayInternet =>
      ref.read(internetConnectionProvider).valueOrNull ?? false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.85) {
        ref.read(clientesControllerProvider.notifier).cargarSiguientePagina();
      }
    });
    _configurarListenerConectividad();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refrescarAlEntrar();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _configurarListenerConectividad() {
    _connectivitySubscription = ref
        .read(connectivityServiceProvider)
        .connectionStream
        .distinct()
        .listen((conectado) async {
      if (conectado) {
        await _sincronizarEnSegundoPlano();
        ref.read(clientesControllerProvider.notifier).cargar();
      }
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
      if (mounted) {
        MensajesGlobales.info('¡Datos sincronizados automáticamente!');
      }
    } catch (e) {
      debugPrint('Error en sincronización automática: $e');
    }
  }

  Future<void> _navegarFormulario({ClienteEntity? cliente}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NuevoClientePage(editar: cliente)),
    );
  }

  PreferredSizeWidget _construirAppBar() {
    return AppBar(
      title: const Text(
        'Gestión de Clientes',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.sync),
          tooltip: 'Sincronizar',
          onPressed: () {
            ref.read(clientesControllerProvider.notifier).forzarRefrescoTotal();
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _construirBotonFlotante() {
    final roleManager = ref.watch(roleManagerProvider);
    if (!roleManager.puedeCrear) return const SizedBox.shrink();

    return FloatingActionButton.extended(
      onPressed: () => _navegarFormulario(),
      icon: const Icon(Icons.add),
      label: const Text('Nuevo cliente'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clientesAsync = ref.watch(clientesControllerProvider);
    final clientesFiltrados = ref.watch(clientesFiltradosProvider);
    final tieneInternet = ref.watch(internetConnectionProvider).value ?? true;
    final filtro = ref.watch(clientesFilterProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: _construirAppBar(),
      floatingActionButton: _construirBotonFlotante(),
      body: Column(
        children: [
          BuscadorReutilizable<ClientesFilter>(
            filtroProvider: clientesFilterProvider,
            hintBusqueda: 'Nombre, RUC o teléfono...',
            onSearch: (query) {
              ref
                  .read(clientesControllerProvider.notifier)
                  .cargar(query: query);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(clientesControllerProvider);
              if (state.isLoading && !state.isRefreshing) {
                return const LinearProgressIndicator(minHeight: 2);
              }
              return const SizedBox(height: 2);
            },
          ),
          if (!tieneInternet && filtro.searchQuery.isNotEmpty)
            Container(
              width: double.infinity,
              color: Colors.orange.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.cloud_off, size: 16, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Modo offline: Resultados limitados al dispositivo.',
                      style: TextStyle(fontSize: 12, color: Colors.orange[900]),
                    ),
                  ),
                ],
              ),
            ),
          _construirFiltroEstado(colorScheme),
          Expanded(
            child: clientesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (_) {
                if (clientesFiltrados.isEmpty) {
                  return const Center(child: Text('No hay clientes registrados'));
                }

                final hayMasDatos = ref
                    .watch(clientesControllerProvider.notifier)
                    .hayMasDatos;

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 80),
                  itemCount: clientesFiltrados.length + (hayMasDatos ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == clientesFiltrados.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                      );
                    }
                    return ClienteCard(
                      cliente: clientesFiltrados[index], esAdministrador: ref
                          .read(roleManagerProvider)
                          .esAdministrador,
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

  Widget _construirFiltroEstado(ColorScheme colorScheme) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final esAdministrador = ref.watch(roleManagerProvider).esAdministrador;
    final filtroActual = ref.watch(clientesFilterProvider);
    final notifier = ref.read(clientesFilterProvider.notifier);

    final String valorActual = filtroActual.soloActivos == null
        ? 'todos'
        : filtroActual.soloActivos == true
            ? 'activos'
            : 'inactivos';

    void limpiarFiltros() {
      notifier.state = ClientesFilter(searchQuery: '', soloActivos: null);
      ref.read(clientesControllerProvider.notifier).cargar(soloActivos: null);
    }

    void aplicarCambioEstado(String? value) {
      if (value == null) return;
      bool? soloActivos;
      if (value == 'todos') {
        limpiarFiltros();
        return;
      } else if (value == 'activos') {
        soloActivos = true;
      } else if (value == 'inactivos' && esAdministrador) {
        soloActivos = false;
      }
      notifier.state = filtroActual.copyWith(soloActivos: soloActivos);
      ref.read(clientesControllerProvider.notifier).cargar(soloActivos: soloActivos);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FILTRAR POR ESTADO',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                  letterSpacing: 0.5,
                  color: colorScheme.primary,
                ),
              ),
              TextButton.icon(
                onPressed: limpiarFiltros,
                icon: const Icon(Icons.refresh, size: 14),
                label: const Text('Limpiar', style: TextStyle(fontSize: 12)),
                style: TextButton.styleFrom(foregroundColor: colorScheme.error),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isDark ? colorScheme.surfaceContainer : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: valorActual,
                isExpanded: true,
                icon: Icon(Icons.tune, color: colorScheme.primary, size: 20),
                borderRadius: BorderRadius.circular(20),
                items: [
                  DropdownMenuItem(
                    value: 'todos',
                    child: _opcionFiltro(Icons.group, colorScheme.primary, 'Todos los clientes'),
                  ),
                  DropdownMenuItem(
                    value: 'activos',
                    child: _opcionFiltro(Icons.check_circle, Colors.green, 'Solo clientes activos'),
                  ),
                  if (esAdministrador)
                    DropdownMenuItem(
                      value: 'inactivos',
                      child: _opcionFiltro(Icons.cancel, Colors.red, 'Solo clientes inactivos'),
                    ),
                ],
                onChanged: aplicarCambioEstado,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _opcionFiltro(IconData icon, Color color, String texto) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 12),
        Text(texto, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ],
    );
  }
}