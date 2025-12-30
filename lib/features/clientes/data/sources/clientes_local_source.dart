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

  /// Crea o actualiza un cliente.
  Future<void> upsert(ClienteEntity c) async {
    c.fechaActualizacion = DateTime.now();
    await isar.writeTxn(() async {
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
