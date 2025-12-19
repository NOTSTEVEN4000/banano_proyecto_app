import 'package:isar/isar.dart';

part 'session_entity.g.dart';

@collection
class SessionEntity {
  Id id = 0; // Siempre 0 para “única sesión”
  late String token;
  String? usuarioId;
  String? rol;
  DateTime? creadoEn;
}
