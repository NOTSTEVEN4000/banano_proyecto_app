import 'package:isar/isar.dart';
import '../models/proveedor_entity.dart';

class ProveedorLocalSource {
  final Isar isar;

  ProveedorLocalSource(this.isar);

  /// Lista todos los proveedores activos, ordenados por nombre.
  Future<List<ProveedorEntity>> listarActivos() async {
    return isar.proveedorEntitys
        .filter()
        .activoEqualTo(true)
        .sortByNombre()
        .findAll();
  }

// lib/features/proveedores/data/sources/proveedor_local.source.dart

Future<void> upsert(ProveedorEntity proveedor) async {
  await isar.writeTxn(() async {
    // 1. Buscar si ya existe este proveedor por su ID Externo
    final existente = await isar.proveedorEntitys
        .filter()
        .idExternoEqualTo(proveedor.idExterno)
        .findFirst();

    // 2. Si existe, le asignamos su ID interno de Isar para que sea una actualización
    if (existente != null) {
      proveedor.id = existente.id;
    } 
    // Si no existe, proveedor.id debe ser el valor por defecto (0 o null según tu entidad) 
    // para que Isar lo trate como nuevo.

    proveedor.fechaActualizacion = DateTime.now();
    await isar.proveedorEntitys.put(proveedor);
  });
}
  /// Busca un proveedor por su ID externo (del servidor).
  Future<ProveedorEntity?> porIdExterno(String idExterno) async {
    return isar.proveedorEntitys
        .filter()
        .idExternoEqualTo(idExterno)
        .findFirst();
  }

  /// Borrado lógico: marca como inactivo y pendiente de sincronización.
  Future<void> eliminarLogico(String idExterno, {bool pendiente = true}) async {
    final proveedor = await porIdExterno(idExterno);
    if (proveedor == null) return;

    proveedor.activo = false;
    proveedor.pendienteSync = pendiente;
    await upsert(proveedor);
  }

  /// Reactiva un proveedor eliminado localmente.
  Future<void> reactivar(String idExterno, {bool pendiente = true}) async {
    final proveedor = await porIdExterno(idExterno);
    if (proveedor == null) return;

    proveedor.activo = true;
    proveedor.pendienteSync = pendiente;
    await upsert(proveedor);
  }

  /// Limpia la bandera de sincronización cuando el servidor confirma la operación.
  Future<void> marcarSynced(String idExterno) async {
    await isar.writeTxn(() async {
      final proveedor = await isar.proveedorEntitys
          .filter()
          .idExternoEqualTo(idExterno)
          .findFirst();

      if (proveedor == null) return;
      proveedor.pendienteSync = false;
      await isar.proveedorEntitys.put(proveedor);
    });
  }

  /// Obtiene todos los proveedores (incluyendo inactivos) - útil para admin.
  Future<List<ProveedorEntity>> listarTodos() async {
    return isar.proveedorEntitys.where().findAll();
  }
}