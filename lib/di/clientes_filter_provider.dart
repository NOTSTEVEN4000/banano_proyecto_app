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
  final clientesAsync = ref.watch(clientesControllerProvider);
  final filtro = ref.watch(clientesFilterProvider);

  return clientesAsync.maybeWhen(
    data: (listaActual) {
      if (listaActual.isEmpty) return [];

      // Aquí aplicamos filtros que NO requieren volver al servidor
      return listaActual.where((c) {
        // 1. Filtro de Eliminados locales (Outbox)
        if (c.activo == false && c.pendienteSync == true) return false;

        // 2. Filtro de Estado (Botones Activos/Inactivos)
        if (filtro.soloActivos != null && c.activo != filtro.soloActivos) {
          return false;
        }

        // 3. Filtro de Provincia (Si decides hacerlo local)
        if (filtro.provincia != null && 
            !c.direccionProvincia.contains(filtro.provincia!)) {
          return false;
        }

        return true;
      }).toList();
    },
    orElse: () => [],
  );
});