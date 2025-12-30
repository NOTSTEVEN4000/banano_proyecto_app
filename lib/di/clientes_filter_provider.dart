// lib/di/clientes_filter_provider.dart

import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Filtro para la lista de clientes
class ClientesFilter {
  final String searchQuery;
  final bool? soloActivos; // true: solo activos, false: solo inactivos, null: todos
  final String? provincia;

  ClientesFilter({
    this.searchQuery = '',
    this.soloActivos,
    this.provincia,
  });

  ClientesFilter copyWith({
    String? searchQuery,
    bool? soloActivos,
    String? provincia,
  }) {
    return ClientesFilter(
      searchQuery: searchQuery ?? this.searchQuery,
      soloActivos: soloActivos ?? this.soloActivos,
      provincia: provincia ?? this.provincia,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientesFilter &&
          runtimeType == other.runtimeType &&
          searchQuery == other.searchQuery &&
          soloActivos == other.soloActivos &&
          provincia == other.provincia;

  @override
  int get hashCode => Object.hash(searchQuery, soloActivos, provincia);
}

// Provider del filtro
final clientesFilterProvider = StateProvider<ClientesFilter>((ref) => ClientesFilter());

// Provider de la lista filtrada
// lib/di/clientes_filter_provider.dart

final clientesFiltradosProvider = Provider<List<ClienteEntity>>((ref) {
  final todos = ref.watch(clientesControllerProvider).value ?? [];
  final filtro = ref.watch(clientesFilterProvider);

  if (todos.isEmpty) return [];

  var filtrados = todos.toList(); // Copia para no mutar original

  // Búsqueda
  if (filtro.searchQuery.isNotEmpty) {
    final query = filtro.searchQuery.toLowerCase().trim();
    filtrados = filtrados.where((c) =>
        c.nombre.toLowerCase().contains(query) ||
        (c.rucCi?.toLowerCase().contains(query) ?? false) ||
        c.contactoTelefono.contains(query) ||
        c.direccionProvincia.toLowerCase().contains(query) ||
        c.direccionCiudad.toLowerCase().contains(query)).toList();
  }

  // Provincia
  if (filtro.provincia != null && filtro.provincia!.isNotEmpty) {
    final provinciaLower = filtro.provincia!.toLowerCase().trim();
    filtrados = filtrados.where((c) =>
        c.direccionProvincia.toLowerCase().trim() == provinciaLower).toList();
  }

  // === FILTRO POR ESTADO: LO MÁS IMPORTANTE ===
  if (filtro.soloActivos != null) {
    // Si es true → solo activos
    // Si es false → solo inactivos
    filtrados = filtrados.where((c) => c.activo == filtro.soloActivos!).toList();
  }
  // Si soloActivos == null → NO aplica ningún filtro por activo → muestra TODOS

  return filtrados;
});