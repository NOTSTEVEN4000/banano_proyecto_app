import 'package:isar/isar.dart';

part 'outbox_operation.g.dart';

@collection
class OutboxOperation {
  Id id = Isar.autoIncrement;

  late String idOperacion; // UUID
  late String metodo; // POST/PUT/DELETE
  late String endpoint; // /vehiculos/veh-001
  late String payloadJson; // JSON string
  late DateTime creadoEn;

  String estado = 'PENDIENTE'; // PENDIENTE | OK | ERROR
  int intentos = 0;
  String? ultimoError;
}
