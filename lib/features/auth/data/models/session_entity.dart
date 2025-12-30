import 'package:isar/isar.dart';

part 'session_entity.g.dart';

@collection
class SessionEntity {
  Id id = Isar.autoIncrement; // O simplemente Id? id;

  String? token;
  String? usuarioId;
  String? rol;
  String? nombreCompleto;
  String? correo;
  DateTime? creadoEn;
}