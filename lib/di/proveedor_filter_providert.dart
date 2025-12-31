import 'package:banano_proyecto_app/di/providers.dart'; // Asegúrate de que aquí esté el proveedoresControllerProvider
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart'; // Tu entidad de proveedor
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Filtro para la lista de proveedores
class ProveedoresFilter {
  final String searchQuery;
  final bool? soloActivos; // true: solo activos, false: solo inactivos, null: todos
  final String? provincia;

  ProveedoresFilter({
    this.searchQuery = '',
    this.soloActivos,
    this.provincia,
  });

  ProveedoresFilter copyWith({
    String? searchQuery,
    bool? soloActivos,
    String? provincia,
  }) {
    return ProveedoresFilter(
      searchQuery: searchQuery ?? this.searchQuery,
      soloActivos: soloActivos ?? this.soloActivos,
      provincia: provincia ?? this.provincia,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProveedoresFilter &&
          runtimeType == other.runtimeType &&
          searchQuery == other.searchQuery &&
          soloActivos == other.soloActivos &&
          provincia == other.provincia;

  @override
  int get hashCode => Object.hash(searchQuery, soloActivos, provincia);
}

// 1. Provider del estado del filtro
final proveedoresFilterProvider = StateProvider<ProveedoresFilter>((ref) => ProveedoresFilter());

// 2. Provider de la lista ya filtrada
final proveedoresFiltradosProvider = Provider<List<ProveedorEntity>>((ref) {
  // Observamos el controlador que trae los datos de Isar/Remoto
  final todosAsync = ref.watch(proveedoresControllerProvider);
  final todos = todosAsync.value ?? [];
  
  final filtro = ref.watch(proveedoresFilterProvider);

  if (todos.isEmpty) return [];

  var filtrados = todos.toList();

  // === 1. EXCLUIR PROVEEDORES ELIMINADOS LOCALMENTE (Outbox pendiente) ===
  // Si activo es false y pendienteSync es true, significa que se eliminó en la app 
  // pero aún no se borra en el servidor.
  filtrados = filtrados.where((p) => p.activo || !p.pendienteSync).toList();

  // === 2. FILTRO POR BÚSQUEDA (SearchQuery) ===
  if (filtro.searchQuery.isNotEmpty) {
    final query = filtro.searchQuery.toLowerCase().trim();
    filtrados = filtrados.where((p) =>
        p.nombre.toLowerCase().contains(query) ||
        (p.rucCi?.toLowerCase().contains(query) ?? false) ||
        p.contactoTelefono.contains(query) ||
        p.direccionProvincia.toLowerCase().contains(query) ||
        p.direccionCiudad.toLowerCase().contains(query)).toList();
  }

  // === 3. FILTRO POR PROVINCIA ===
  if (filtro.provincia != null && filtro.provincia!.isNotEmpty) {
    final provinciaLower = filtro.provincia!.toLowerCase().trim();
    filtrados = filtrados.where((p) =>
        p.direccionProvincia.toLowerCase().trim() == provinciaLower).toList();
  }

  // === 4. FILTRO POR ESTADO (Activo/Inactivo) ===
  if (filtro.soloActivos != null) {
    filtrados = filtrados.where((p) => p.activo == filtro.soloActivos!).toList();
  }

  return filtrados;
});