import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_carga_cajas_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_combustible_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_insumos_entity.dart';
import 'package:banano_proyecto_app/sync/outbox/outbox_operation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/auth/data/models/session_entity.dart';

class IsarDb {
  static Future<Isar> open() async {
    // 1. Intentar obtener la instancia existente por su nombre
    final instanciaActiva = Isar.getInstance('banano_db');
    if (instanciaActiva != null) {
      return instanciaActiva;
    }


    // 2. Si no existe, abrirla
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        SessionEntitySchema,
        OutboxOperationSchema,
        VehiculoEntitySchema,
        ClienteEntitySchema,
        ProveedorEntitySchema,
        ViajeEntitySchema,
        ViajeInsumosEntitySchema,
        ViajeCombustibleEntitySchema,
        ViajeCargaCajasEntitySchema,
      ],
      directory: dir.path,
      name: 'banano_db',
    );
  }
}