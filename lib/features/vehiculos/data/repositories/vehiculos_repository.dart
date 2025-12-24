import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/sources/vehiculos_local_source.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/sources/vehiculos_remote_source.dart';
import 'package:banano_proyecto_app/sync/outbox/outbox_repository.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

class VehiculosRepository {
  final VehiculosLocalSource local;
  final VehiculosRemoteSource remote;
  final OutboxRepository outbox;

  VehiculosRepository({
    required this.local,
    required this.remote,
    required this.outbox,
  });

  Future<List<VehiculoEntity>> listar() async {
    List<Map<String, dynamic>> remoto = [];

    // 1) Intentar bajar del backend
    try {
      remoto = await remote.listar(incluirInactivos: true);

      // Obtener set de idExterno del servidor
      final Set<String> remotosIds = remoto
          .map((m) => (m['idExterno'] ?? '').toString())
          .where((id) => id.isNotEmpty)
          .toSet();

      // Obtener todos los locales (activos e inactivos)
      final locales = await local.isar.vehiculoEntitys.where().findAll();
      final Set<String> localesIds = locales.map((e) => e.idExterno).toSet();

      // Borrar locales que ya no existen en servidor (pero NO si tienen pendienteSync)
      final idsABorrar = localesIds.difference(remotosIds);
      for (final idExterno in idsABorrar) {
        final localExistente = await local.porIdExterno(idExterno);
        if (localExistente != null && !localExistente.pendienteSync) {
          await local.isar.writeTxn(() async {
            await local.isar.vehiculoEntitys.delete(localExistente.id);
          });
        }
      }

      // Actualizar/insertar lo que viene del servidor
      for (final m in remoto) {
        final idExterno = (m['idExterno'] ?? '').toString();
        if (idExterno.isEmpty) continue;

        final localExistente = await local.porIdExterno(idExterno);

        // Si local tiene cambios pendientes, NO pisar
        if (localExistente != null && localExistente.pendienteSync) {
          continue;
        }

        final v = localExistente ?? VehiculoEntity();

        v
          ..idExterno = idExterno
          ..placa = (m['placa'] ?? '').toString()
          ..nombre = (m['nombre'] ?? '').toString()
          ..capacidadCajas = (m['capacidadCajas'] is int)
              ? (m['capacidadCajas'] as int)
              : (m['capacidadCajas'] is num
                    ? (m['capacidadCajas'] as num).toInt()
                    : null)
          ..activo = (m['activo'] ?? true) == true
          ..pendienteSync = false;

        await local.upsert(v);
      }
    } catch (_) {
      // Sin internet → no hacemos nada con el servidor
    }

    // 2) Devolver solo activos locales (incluyendo pendientes)
    return await local.listarActivos();
  }

  Future<void> crear(
    String placa,
    String nombre,
    int? capacidad,
    String tipo,
    String marca,
    String modelo,
    int? anio,
    String? color,
    int? kilometraje,
    String? estado,
    String? conductorId,
    String? conductorNombre,
  ) async {
    final idExterno = const Uuid().v4();

    final v = VehiculoEntity()
      ..idExterno = idExterno
      ..placa = placa
      ..nombre = nombre
      ..capacidadCajas = capacidad
      ..tipo = tipo
      ..marca = marca
      ..modelo = modelo
      ..anio = anio
      ..color = color
      ..kilometrajeActual = kilometraje
      ..estado = estado ?? 'Operativo'
      ..conductorAsignado = conductorId
      ..conductorAsignadoNombre = conductorNombre
      ..activo = true
      ..pendienteSync = false;

    await local.upsert(v);

    try {
      await remote.crear(
        idExterno: idExterno,
        placa: placa,
        nombre: nombre,
        capacidadCajas: capacidad,
        tipo: tipo,
        marca: marca,
        modelo: modelo,
        anio: anio,
        color: color,
        kilometrajeActual: kilometraje,
        estado: estado,
        conductorAsignado: conductorId,
        conductorAsignadoNombre: conductorNombre,
      );
    } catch (_) {
      v.pendienteSync = true;
      await local.upsert(v);

      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'POST',
        endpoint: '/vehiculos',
        payload: {
          "idExterno": idExterno,
          "placa": placa,
          "nombre": nombre,
          "capacidadCajas": capacidad,
          "tipo": tipo,
          "marca": marca,
          "modelo": modelo,
          if (anio != null) "anio": anio,
          if (color != null) "color": color,
          if (kilometraje != null) "kilometrajeActual": kilometraje,
          if (estado != null) "estado": estado,
          if (conductorId != null) "conductorAsignado": conductorId,
          if (conductorNombre != null)
            "conductorAsignadoNombre": conductorNombre,
        },
      );
    }
  }

  Future<void> editar(
    String idExterno,
    String placa,
    String nombre,
    int? capacidad,
    String tipo,
    String marca,
    String modelo,
    int? anio,
    String? color,
    int? kilometraje,
    String? estado,
    String? conductorId,
    String? conductorNombre,
  ) async {
    final v = await local.porIdExterno(idExterno);
    if (v == null) return;
    v
      ..placa = placa
      ..nombre = nombre
      ..capacidadCajas = capacidad
      ..tipo = tipo
      ..marca = marca
      ..modelo = modelo
      ..anio = anio
      ..color = color
      ..kilometrajeActual = kilometraje
      ..estado = estado ?? 'Operativo'
      ..conductorAsignado = conductorId
      ..conductorAsignadoNombre = conductorNombre
      ..activo = true;

    await local.upsert(v);

    try {
      await remote.editar(idExterno, {
        "placa": placa,
        "nombre": nombre,
        "capacidadCajas": capacidad,
        "tipo": tipo,
        "marca": marca,
        "modelo": modelo,
        if (anio != null) "anio": anio,
        if (color != null) "color": color,
        if (kilometraje != null) "kilometrajeActual": kilometraje,
        if (estado != null) "estado": estado,
        if (conductorId != null) "conductorAsignado": conductorId,
        if (conductorNombre != null) "conductorAsignadoNombre": conductorNombre,
      });
    } catch (_) {
      v.pendienteSync = true;
      await local.upsert(v);

      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'PATCH',
        endpoint: '/vehiculos/$idExterno',
        payload: {
          "placa": placa,
          "nombre": nombre,
          "capacidadCajas": capacidad,
          "tipo": tipo,
          "marca": marca,
          "modelo": modelo,
          if (anio != null) "anio": anio,
          if (color != null) "color": color,
          if (kilometraje != null) "kilometrajeActual": kilometraje,
          if (estado != null) "estado": estado,
          if (conductorId != null) "conductorAsignado": conductorId,
          if (conductorNombre != null)
            "conductorAsignadoNombre": conductorNombre,
        },
      );
    }
  }

  Future<void> eliminar(String idExterno) async {
    final localVehiculo = await local.porIdExterno(idExterno);
    if (localVehiculo == null) return;

    // Marcar como inactivo localmente siempre
    localVehiculo.activo = false;

    // Intentar eliminar en el backend
    try {
      await remote.eliminar(idExterno);

      // Si tuvo éxito y hay internet → NO queda pendiente
      localVehiculo.pendienteSync = false;
      await local.upsert(localVehiculo);
    } catch (_) {
      // Si falla (sin internet o error servidor) → queda pendiente
      localVehiculo.pendienteSync = true;
      await local.upsert(localVehiculo);

      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'DELETE',
        endpoint: '/vehiculos/$idExterno',
        payload: {"idExterno": idExterno},
      );
    }

    // Opcional: refrescar lista para reflejar cambios
    await listar();
  }

  Future<void> eliminarOnlineOnly(
    String idExterno, {
    required bool hayInternet,
  }) async {
    if (!hayInternet) {
      throw Exception(
        'Sin internet: no se puede eliminar. Conéctate para eliminar.',
      );
    }

    // Eliminar en backend (soft delete)
    await remote.eliminar(idExterno);

    // Refrescar local trayendo desde backend
    await listar();
  }
}
