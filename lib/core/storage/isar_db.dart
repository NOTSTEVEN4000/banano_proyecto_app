import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:banano_proyecto_app/sync/outbox/outbox_operation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/auth/data/models/session_entity.dart';

class IsarDb {
  static Future<Isar> open() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [SessionEntitySchema,
      OutboxOperationSchema,
      VehiculoEntitySchema,
      ClienteEntitySchema,
      ProveedorEntitySchema,
      ],
      directory: dir.path,
      name: 'banano_db',
    );
  }
}
