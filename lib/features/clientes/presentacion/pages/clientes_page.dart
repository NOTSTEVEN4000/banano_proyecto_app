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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _configurarListenerConectividad();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.85) {
      ref.read(clientesControllerProvider.notifier).cargarSiguientePagina();
    }
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
      // 1. SUBIR cambios locales al servidor primero
      await ref.read(clientesControllerProvider.notifier).subirCambiosLocales();
      ref.read(clientesControllerProvider.notifier).forzarRefrescoTotal();
    }
  });
}

  @override
  Widget build(BuildContext context) {
    final clientesAsync = ref.watch(clientesControllerProvider);
    final clientesFiltrados = ref.watch(clientesFiltradosProvider);
    final tieneInternet = ref.watch(internetConnectionProvider).value ?? true;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: _construirAppBar(),
      floatingActionButton: _construirBotonFlotante(),
      body: Column(
        children: [
          BuscadorReutilizable<ClientesFilter>(
            filtroProvider: clientesFilterProvider,
            hintBusqueda: 'Nombre, RUC o teléfono...',
            onSearch: (query) => ref.read(clientesControllerProvider.notifier).cargar(query: query),
          ),
          
          // 1. Indicador de carga superior (Discreto)
          if (clientesAsync.isLoading) 
            const LinearProgressIndicator(minHeight: 2)
          else 
            const SizedBox(height: 2),

          // 2. Banner Offline
          if (!tieneInternet) _construirBannerOffline(),

          _construirFiltroEstado(colorScheme),

          // 3. Listado Principal
          Expanded(
            child: clientesAsync.when(
              skipLoadingOnReload: true, // ✅ EVITA EL SPINNER CENTRAL AL REFRESCAR
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (listaCompleta) {
                if (clientesFiltrados.isEmpty) {
                  return const Center(child: Text('No se encontraron clientes'));
                }

                final notifier = ref.watch(clientesControllerProvider.notifier);

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 80),
                  // Solo sumamos 1 si realmente hay más datos para cargar
                  itemCount: clientesFiltrados.length + (notifier.hayMasDatos ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == clientesFiltrados.length) {
                      // ✅ Spinner de paginación (Solo al final)
                      return const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                      );
                    }
                    
                    return ClienteCard(
                      cliente: clientesFiltrados[index],
                      esAdministrador: ref.read(roleManagerProvider).esAdministrador,
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

  // --- WIDGETS DE APOYO ---

  PreferredSizeWidget _construirAppBar() {
    return AppBar(
      title: const Text('Gestión de Clientes', style: TextStyle(fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
          icon: const Icon(Icons.sync),
          onPressed: () => ref.read(clientesControllerProvider.notifier).forzarRefrescoTotal(),
        ),
      ],
    );
  }

  Widget _construirBannerOffline() {
    return Container(
      width: double.infinity,
      color: Colors.orange.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: const Row(
        children: [
          Icon(Icons.cloud_off, size: 16, color: Colors.orange),
          SizedBox(width: 8),
          Text('Modo offline: Datos locales', style: TextStyle(fontSize: 12, color: Colors.orange)),
        ],
      ),
    );
  }

  Widget _construirFiltroEstado(ColorScheme colorScheme) {
    final filtroActual = ref.watch(clientesFilterProvider);
    final esAdmin = ref.watch(roleManagerProvider).esAdministrador;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('FILTRAR POR ESTADO', 
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, color: colorScheme.primary)),
              TextButton(
                onPressed: () {
                  ref.read(clientesFilterProvider.notifier).state = ClientesFilter(searchQuery: '', soloActivos: null);
                  ref.read(clientesControllerProvider.notifier).cargar(soloActivos: null);
                }, 
                child: const Text('Limpiar', style: TextStyle(fontSize: 12))
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: filtroActual.soloActivos == null ? 'todos' : (filtroActual.soloActivos! ? 'activos' : 'inactivos'),
                isExpanded: true,
                items: [
                  DropdownMenuItem(value: 'todos', child: _opcionFiltro(Icons.group, colorScheme.primary, 'Todos')),
                  DropdownMenuItem(value: 'activos', child: _opcionFiltro(Icons.check_circle, Colors.green, 'Activos')),
                  if (esAdmin) DropdownMenuItem(value: 'inactivos', child: _opcionFiltro(Icons.cancel, Colors.red, 'Inactivos')),
                ],
                onChanged: (val) {
                  bool? soloActivos = val == 'todos' ? null : (val == 'activos');
                  ref.read(clientesFilterProvider.notifier).state = filtroActual.copyWith(soloActivos: soloActivos);
                  ref.read(clientesControllerProvider.notifier).cargar(soloActivos: soloActivos);
                },
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
        Text(texto, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _construirBotonFlotante() {
    if (!ref.watch(roleManagerProvider).puedeCrear) return const SizedBox.shrink();
    return FloatingActionButton.extended(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NuevoClientePage())),
      icon: const Icon(Icons.add),
      label: const Text('Nuevo cliente'),
    );
  }
}