import 'package:isar/isar.dart';
import '../models/vehiculo_entity.dart';

class VehiculosLocalSource {
  final Isar isar;
  VehiculosLocalSource(this.isar);

  Future<List<VehiculoEntity>> listarActivos() async {
    return isar.vehiculoEntitys.filter().activoEqualTo(true).sortByPlaca().findAll();
  }

  Future<void> upsert(VehiculoEntity v) async {
    v.fechaActualizacion = DateTime.now();
    await isar.writeTxn(() async {
      await isar.vehiculoEntitys.put(v);
    });
  }

  Future<VehiculoEntity?> porIdExterno(String idExterno) async {
    return isar.vehiculoEntitys.filter().idExternoEqualTo(idExterno).findFirst();
  }

Future<void> eliminarLogico(String idExterno, {bool pendiente = true}) async {
    final v = await porIdExterno(idExterno);
    if (v == null) return;
    v.activo = false;
    v.pendienteSync =
        pendiente; // Ahora puedes controlar si queda pendiente o no
    await upsert(v);
  }

  Future<void> marcarSynced(String idExterno) async {
    await isar.writeTxn(() async {
      final v = await isar.vehiculoEntitys
          .filter()
          .idExternoEqualTo(idExterno)
          .findFirst();

      if (v == null) return;
      v.pendienteSync = false;
      await isar.vehiculoEntitys.put(v);
    });
  }
}
