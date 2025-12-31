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

final clientesFiltradosProvider = Provider<List<ClienteEntity>>((ref) {
  final todos = ref.watch(clientesControllerProvider).value ?? [];
  final filtro = ref.watch(clientesFilterProvider);

  if (todos.isEmpty) return [];

  var filtrados = todos.toList();

  // === PRIMERO: EXCLUIR CLIENTES ELIMINADOS LOCALMENTE ===
  // Siempre filtramos los que están marcados como eliminados (activo = false y pendienteSync = true)
  filtrados = filtrados.where((c) => c.activo || !c.pendienteSync).toList();
  // Esto asegura que un cliente eliminado localmente (activo=false + pendienteSync=true) NUNCA aparezca

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

  // Filtro por estado (solo si se aplica)
  if (filtro.soloActivos != null) {
    filtrados = filtrados.where((c) => c.activo == filtro.soloActivos!).toList();
  }
  // Si soloActivos == null → muestra todos los que NO están eliminados localmente

  return filtrados;
});