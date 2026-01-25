import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehiculosFilter {
  final String searchQuery;
  final String estadoFiltro; // Ahora es obligatorio (no nulo)

  VehiculosFilter({
    this.searchQuery = '',
    this.estadoFiltro = 'Operativo', // Estado inicial por defecto
  });

  VehiculosFilter copyWith({
    String? searchQuery,
    String? estadoFiltro,
  }) {
    return VehiculosFilter(
      searchQuery: searchQuery ?? this.searchQuery,
      estadoFiltro: estadoFiltro ?? this.estadoFiltro,
    );
  }
}

final vehiculosFilterProvider = StateProvider<VehiculosFilter>((ref) => VehiculosFilter());

final vehiculosFiltradosProvider = Provider<List<VehiculoEntity>>((ref) {
  final todos = ref.watch(vehiculosControllerProvider).value ?? [];
  final filtro = ref.watch(vehiculosFilterProvider);

  if (todos.isEmpty) return [];

  return todos.where((v) {
    // 1. Filtro de Texto
    final query = filtro.searchQuery.toLowerCase();
    final coincideBusqueda = query.isEmpty ||
        v.placa.toLowerCase().contains(query) ||
        v.nombre.toLowerCase().contains(query) ||
        v.marca.toLowerCase().contains(query) ||
        (v.conductorAsignadoNombre?.toLowerCase().contains(query) ?? false);

    // 2. Filtro de Estado (Comparación directa estricta)
    final coincideEstado = v.estado == filtro.estadoFiltro;

    return coincideBusqueda && coincideEstado;
  }).toList();
});