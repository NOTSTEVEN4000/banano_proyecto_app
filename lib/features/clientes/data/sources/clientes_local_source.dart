import 'package:isar/isar.dart';
import '../models/cliente_entity.dart';

class ClientesLocalSource {
  final Isar isar;
  ClientesLocalSource(this.isar);

  /// Lista todos los clientes activos, ordenados por RUC/CI.
  Future<List<ClienteEntity>> listarActivos() async {
    return isar.clienteEntitys
        .filter()
        .activoEqualTo(true)
        .sortByIdExterno()
        .findAll();
  }

  // NUEVO: Método para obtener clientes paginados desde Isar
  // En ClientesLocalSource
  Future<List<ClienteEntity>> obtenerPaginados({
    required int offset,
    required int limite,
    String? search,
    required bool esAdministrador,
  }) async {
    var query = isar.clienteEntitys.filter().idExternoIsNotEmpty();

    // Búsqueda profesional en Isar
    if (search != null && search.isNotEmpty) {
      query = query.group(
        (q) => q
            .nombreContains(search, caseSensitive: false)
            .or()
            .rucCiContains(search, caseSensitive: false),
      );
    }

    // Filtro de seguridad (Solo activos si no es admin)
    if (!esAdministrador) {
      query = query.group(
        (q) => q.activoEqualTo(true).or().pendienteSyncEqualTo(true),
      );
    }

    return await query.sortByNombre().offset(offset).limit(limite).findAll();
  }

  /// Crea o actualiza un cliente.
  // En ClientesLocalSource
  Future<void> upsert(ClienteEntity c) async {
    await isar.writeTxn(() async {
      // Intentar buscar el ID local si no lo tiene
      if (c.id == Isar.autoIncrement) {
        final existente = await isar.clienteEntitys
            .filter()
            .idExternoEqualTo(c.idExterno)
            .findFirst();
        if (existente != null) c.id = existente.id;
      }
      c.fechaActualizacion = DateTime.now();
      await isar.clienteEntitys.put(c);
    });
  }

  /// Busca un cliente por su ID de servidor (UUID).
  Future<ClienteEntity?> porIdExterno(String idExterno) async {
    return isar.clienteEntitys.filter().idExternoEqualTo(idExterno).findFirst();
  }

  /// Borrado lógico: Cambia el estado 'activo' a false.
  Future<void> eliminarLogico(String idExterno, {bool pendiente = true}) async {
    final c = await porIdExterno(idExterno);
    if (c == null) return;

    c.activo = false;
    c.pendienteSync = pendiente;
    await upsert(c);
  }

  /// Limpia la bandera de sincronización una vez que el servidor confirma la operación.
  Future<void> marcarSynced(String idExterno) async {
    await isar.writeTxn(() async {
      final c = await isar.clienteEntitys
          .filter()
          .idExternoEqualTo(idExterno)
          .findFirst();

      if (c == null) return;
      c.pendienteSync = false;
      await isar.clienteEntitys.put(c);
    });
  }
}
