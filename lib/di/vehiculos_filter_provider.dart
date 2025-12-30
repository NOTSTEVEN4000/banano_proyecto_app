import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehiculosFilter {
  final String searchQuery;
  final String? estadoFiltro;
  final bool soloActivos;

  VehiculosFilter({
    this.searchQuery = '',
    this.estadoFiltro,
    this.soloActivos = true,
  });

  VehiculosFilter copyWith({
    String? searchQuery,
    String? estadoFiltro,
    bool? soloActivos,
  }) {
    return VehiculosFilter(
      searchQuery: searchQuery ?? this.searchQuery,
      estadoFiltro: estadoFiltro ?? this.estadoFiltro,
      soloActivos: soloActivos ?? this.soloActivos,
    );
  }
}

final vehiculosFilterProvider = StateProvider<VehiculosFilter>((ref) => VehiculosFilter());

final vehiculosFiltradosProvider = Provider<List<VehiculoEntity>>((ref) {
  final todos = ref.watch(vehiculosControllerProvider).value ?? [];
  final filtro = ref.watch(vehiculosFilterProvider);

  if (todos.isEmpty) return [];

  var filtrados = todos;

  // Búsqueda
  if (filtro.searchQuery.isNotEmpty) {
    final query = filtro.searchQuery.toLowerCase();
    filtrados = filtrados.where((v) =>
        v.placa.toLowerCase().contains(query) ||
        v.nombre.toLowerCase().contains(query) ||
        v.marca.toLowerCase().contains(query) ||
        v.modelo.toLowerCase().contains(query) ||
        (v.conductorAsignadoNombre?.toLowerCase().contains(query) ?? false)).toList();
  }

  // Estado
  if (filtro.estadoFiltro != null) {
    filtrados = filtrados.where((v) => v.estado == filtro.estadoFiltro).toList();
  }

  // Solo activos
  if (filtro.soloActivos) {
    filtrados = filtrados.where((v) => v.activo).toList();
  }

  return filtrados;
});