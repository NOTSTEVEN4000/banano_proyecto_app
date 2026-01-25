import 'package:banano_proyecto_app/features/viajes/data/models/viaje_carga_cajas_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_combustible_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_insumos_entity.dart';
import 'package:isar/isar.dart';

class ViajesLocalSource {
  final Isar isar;

  ViajesLocalSource(this.isar);

  // ── VIAJES PRINCIPALES ────────────────────────────────────────────────

  /// Lista viajes por fecha (para la pantalla principal)
  Future<List<ViajeEntity>> listarPorFecha(String fecha, String empresaId) async {
    return isar.viajeEntitys
        .filter()
        .fechaEqualTo(fecha)
        .empresaIdEqualTo(empresaId)
        .activoEqualTo(true)
        .sortByFechaCreacionDesc()
        .findAll();
  }

  /// Busca un viaje por su idExterno
  Future<ViajeEntity?> porIdExterno(String idExterno) async {
    return isar.viajeEntitys
        .filter()
        .idExternoEqualTo(idExterno)
        .findFirst();
  }

  /// Upsert inteligente: actualiza si existe, inserta si no
  Future<void> upsert(ViajeEntity viaje) async {
    await isar.writeTxn(() async {
      final existente = await porIdExterno(viaje.idExterno);
      if (existente != null) {
        viaje.id = existente.id;
      }
      viaje.fechaActualizacion = DateTime.now();
      await isar.viajeEntitys.put(viaje);
    });
  }

  /// Borrado lógico (marca inactivo + pendienteSync)
  Future<void> eliminarLogico(String idExterno, {bool pendiente = true}) async {
    final viaje = await porIdExterno(idExterno);
    if (viaje == null) return;

    viaje.activo = false;
    viaje.pendienteSync = pendiente;
    await upsert(viaje);
  }

  // ── VIAJE INSUMOS ─────────────────────────────────────────────────────

  Future<ViajeInsumosEntity?> getInsumosPorViaje(String viajeIdExterno) async {
    final entity = await isar.viajeInsumosEntitys
      .filter()
      .viajeIdExternoEqualTo(viajeIdExterno)
      .findFirst();
  print('getInsumosPorViaje: ${entity != null ? entity.items.length : "null"} insumos');
  return entity;
  }

  Future<void> upsertInsumos(ViajeInsumosEntity insumos) async {
  await isar.writeTxn(() async {
    print('Upsert insumos: idExterno=${insumos.idExterno}, items=${insumos.items.length}');
    final existente = await getInsumosPorViaje(insumos.viajeIdExterno);
    if (existente != null) {
      insumos.id = existente.id;
      print('Actualizando existente con ID ${existente.id}');
    } else {
      print('Nuevo registro de insumos');
    }
    insumos.fechaActualizacion = DateTime.now();
    await isar.viajeInsumosEntitys.put(insumos);
    print('put() ejecutado OK');
  });
}

  // ── VIAJE CARGAS CAJAS ────────────────────────────────────────────────

  Future<List<ViajeCargaCajasEntity>> getCargasPorViaje(String viajeIdExterno) async {
    return isar.viajeCargaCajasEntitys
        .filter()
        .viajeIdExternoEqualTo(viajeIdExterno)
        .findAll();
  }

  Future<void> upsertCargaCajas(ViajeCargaCajasEntity carga) async {
  await isar.writeTxn(() async {
    final existente = await isar.viajeCargaCajasEntitys
        .filter()
        .idExternoEqualTo(carga.idExterno)
        .findFirst();

    if (existente != null) {
      carga.id = existente.id; // Crucial para que Isar no cree duplicados
    }
    await isar.viajeCargaCajasEntitys.put(carga);
  });
}

  // ── VIAJE COMBUSTIBLE ─────────────────────────────────────────────────

  Future<List<ViajeCombustibleEntity>> getCombustiblePorViaje(String viajeIdExterno) async {
    return isar.viajeCombustibleEntitys
        .filter()
        .viajeIdExternoEqualTo(viajeIdExterno)
        .findAll();
  }

  Future<void> upsertCombustible(ViajeCombustibleEntity combustible) async {
  await isar.writeTxn(() async {
    // Busca si ya existe por idExterno
    final existente = await isar.viajeCombustibleEntitys
        .filter()
        .idExternoEqualTo(combustible.idExterno)
        .findFirst();

    // Si existe, reutiliza el ID interno de Isar
    if (existente != null) {
      combustible.id = existente.id;
    }

    // Siempre actualiza la fecha de modificación
    combustible.fechaActualizacion = DateTime.now();

    // Guarda (inserta o actualiza)
    await isar.viajeCombustibleEntitys.put(combustible);
  });
}
  // Opcional: marcar como sincronizado después de éxito en remote
  Future<void> marcarSynced(String idExterno) async {
    await isar.writeTxn(() async {
      final viaje = await porIdExterno(idExterno);
      if (viaje != null) {
        viaje.pendienteSync = false;
        await isar.viajeEntitys.put(viaje);
      }
    });
  }
}