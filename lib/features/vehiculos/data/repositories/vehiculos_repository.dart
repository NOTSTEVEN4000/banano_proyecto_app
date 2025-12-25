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

  Future<List<VehiculoEntity>> listar({required String? rol}) async {
    final bool esAdministrador = rol == 'ADMINISTRADOR';
    List<Map<String, dynamic>> remoto = [];

    try {
      // 1. Traer del servidor según rol
      remoto = esAdministrador
          ? await remote.listarTodos()
          : await remote.listarActivos();

      // 2. Actualizar/insertar desde servidor (SIN DUPLICAR)
      for (final m in remoto) {
        final idExterno = m['idExterno']?.toString() ?? '';
        if (idExterno.isEmpty) continue;

        // Buscar si ya existe localmente
        final localExistente = await local.porIdExterno(idExterno);

        // Si hay cambios pendientes locales → NO pisar
        if (localExistente != null && localExistente.pendienteSync) {
          continue;
        }

        // USAR EL EXISTENTE SI HAY, o crear nuevo
        final v = localExistente ?? VehiculoEntity();

        // Asignar datos del servidor
        v
          ..idExterno = idExterno
          ..placa = m['placa']?.toString() ?? ''
          ..nombre = m['nombre']?.toString() ?? ''
          ..capacidadCajas = m['capacidadCajas'] is num
              ? (m['capacidadCajas'] as num).toInt()
              : null
          ..tipo = m['tipo']?.toString() ?? 'Desconocido'
          ..marca = m['marca']?.toString() ?? ''
          ..modelo = m['modelo']?.toString() ?? ''
          ..anio = m['anio'] is num ? (m['anio'] as num).toInt() : null
          ..color = m['color']?.toString()
          ..kilometrajeActual = m['kilometrajeActual'] is num
              ? (m['kilometrajeActual'] as num).toInt()
              : null
          ..estado = m['estado']?.toString()
          ..conductorAsignado = m['conductorAsignado']?.toString()
          ..conductorAsignadoNombre = m['conductorAsignadoNombre']?.toString()
          ..activo = m['activo'] == true
          ..pendienteSync = false
          ..fechaCreacion = DateTime.parse(m['fechaCreacion'] ?? DateTime.now().toIso8601String())
          ..fechaActualizacion = DateTime.parse(m['fechaActualizacion'] ?? DateTime.now().toIso8601String());

        await local.upsert(v); // ← upsert usa el existente o crea nuevo
      }

      // 3. Limpiar locales que ya NO existen en el servidor
      final Set<String> remotosIds = remoto
          .map((m) => m['idExterno']?.toString() ?? '')
          .toSet();
      final locales = await local.listarActivos();

      for (final localV in locales) {
        if (!remotosIds.contains(localV.idExterno) && !localV.pendienteSync) {
          await local.isar.writeTxn(() async {
            await local.isar.vehiculoEntitys.delete(localV.id);
          });
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error al sincronizar: $e');
    }

    // 4. Devolver según rol
    if (esAdministrador) {
      return await local.isar.vehiculoEntitys.where().sortByPlaca().findAll();
    } else {
      return await local.isar.vehiculoEntitys
          .filter()
          .group((q) => q.activoEqualTo(true).or().pendienteSyncEqualTo(true))
          .sortByPlaca()
          .findAll();
    }
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
      ..pendienteSync = false
      ..fechaCreacion = DateTime.now()
      ..fechaActualizacion = DateTime.now();

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

    try {
      await remote.eliminar(idExterno);
      // Éxito → BORRAR COMPLETAMENTE local
      await local.isar.writeTxn(() async {
        final v = await local.porIdExterno(idExterno);
        if (v != null) await local.isar.vehiculoEntitys.delete(v.id);
      });
    } catch (_) {
      // FALLÓ → marcar como inactivo + pendiente
      localVehiculo.activo = false;
      localVehiculo.pendienteSync = true;
      await local.upsert(localVehiculo);

      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'DELETE',
        endpoint: '/vehiculos/$idExterno',
        payload: {"idExterno": idExterno},
      );
    }
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
    await remote.eliminar(idExterno);
  }
}
