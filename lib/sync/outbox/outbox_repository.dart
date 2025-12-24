import 'dart:convert';
import 'package:isar/isar.dart';
import 'outbox_operation.dart';

class OutboxRepository {
  final Isar isar;
  OutboxRepository(this.isar);

  Future<void> enqueue({
    required String idOperacion,
    required String metodo,
    required String endpoint,
    required Map<String, dynamic> payload,
  }) async {
    final op = OutboxOperation()
      ..idOperacion = idOperacion
      ..metodo = metodo
      ..endpoint = endpoint
      ..payloadJson = jsonEncode(payload)
      ..creadoEn = DateTime.now()
      ..estado = 'PENDIENTE'
      ..intentos = 0;

    await isar.writeTxn(() async {
      await isar.outboxOperations.put(op);
    });
  }

  Future<List<OutboxOperation>> pendientes({int limit = 50}) async {
    return isar.outboxOperations
        .filter()
        .estadoEqualTo('PENDIENTE')
        .sortByCreadoEn()
        .limit(limit)
        .findAll();
  }

  Future<void> marcarEnviando(Id id) async {
    await isar.writeTxn(() async {
      final op = await isar.outboxOperations.get(id);
      if (op == null) return;
      op.estado = 'ENVIANDO';
      await isar.outboxOperations.put(op);
    });
  }

  Future<void> requeueErrores() async {
    await isar.writeTxn(() async {
      final errores = await isar.outboxOperations
          .filter()
          .estadoEqualTo('ERROR')
          .findAll();

      for (final op in errores) {
        op.estado = 'PENDIENTE';
        await isar.outboxOperations.put(op);
      }
    });
  }

  Future<void> eliminar(Id id) async {
    await isar.writeTxn(() async {
      await isar.outboxOperations.delete(id);
    });
  }

  Future<void> marcarOk(Id id) async {
    await isar.writeTxn(() async {
      final op = await isar.outboxOperations.get(id);
      if (op == null) return;
      op.estado = 'OK';
      await isar.outboxOperations.put(op);
    });
  }

  Future<void> marcarError(Id id, String err) async {
    await isar.writeTxn(() async {
      final op = await isar.outboxOperations.get(id);
      if (op == null) return;
      op.estado = 'ERROR';
      op.ultimoError = err;
      op.intentos += 1;
      await isar.outboxOperations.put(op);
    });
  }
}
