import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/auth/data/models/session_entity.dart';

class IsarDb {
  static Future<Isar> open() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [SessionEntitySchema],
      directory: dir.path,
    );
  }
}
