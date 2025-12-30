import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/clientes/data/sources/clientes_local_source.dart';
import 'package:banano_proyecto_app/features/clientes/data/sources/clientes_remote_source.dart';
import 'package:banano_proyecto_app/sync/outbox/outbox_repository.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

class ClientesRepository {
  final ClientesLocalSource local;
  final ClientesRemoteSource remote;
  final OutboxRepository outbox;

  ClientesRepository({
    required this.local,
    required this.remote,
    required this.outbox,
  });

  // ──────────────────────────────────────────────────────────────
  // LISTAR
  // ──────────────────────────────────────────────────────────────
  Future<List<ClienteEntity>> listar({required String? rol}) async {
    final bool esAdministrador = rol == 'ADMINISTRADOR';
    List<Map<String, dynamic>> remoto = [];
    bool hayInternet = false;

    try {
      remoto = esAdministrador
          ? await remote.listarTodos()
          : await remote.listarActivos();

      hayInternet = true;

      // SI HAY INTERNET LIMPIAR LOCALES NO PENDIENTES

      await local.isar.writeTxn(() async {
        final todosLocales = await local.isar.clienteEntitys.where().findAll();
        for (final localV in todosLocales) {
          if (!localV.pendienteSync) {
            await local.isar.clienteEntitys.delete(localV.id);
          }
        }
      });

      for (final m in remoto) {
        final idExterno = m['idExterno']?.toString() ?? '';
        if (idExterno.isEmpty) continue;
        final v = _mapToEntity(m);
        await local.upsert(v);
      }
    } catch (e) {
      hayInternet = false;
      print('Sin internet, usando datos locales: $e');
    }

    if (hayInternet) {
      if (esAdministrador) {
        return await local.isar.clienteEntitys.where().sortByNombre().findAll();
      } else {
        return await local.isar.clienteEntitys
            .filter()
            .activoEqualTo(true)
            .sortByNombre()
            .findAll();
      }
    } else {
      if (esAdministrador) {
        return await local.isar.clienteEntitys.where().sortByNombre().findAll();
      } else {
        return await local.isar.clienteEntitys
            .filter()
            .group((q) => q.activoEqualTo(true).or().pendienteSyncEqualTo(true))
            .sortByNombre()
            .findAll();
      }
    }
  }

  // ──────────────────────────────────────────────────────────────
  // CREAR
  // ──────────────────────────────────────────────────────────────
  Future<void> crear({
    required String nombre,
    String? rucCi,
    required String cNombre,
    required String cTelefono,
    String? cCorreo,
    required String dProvincia,
    required String dCiudad,
    required String dDetalle,
    required double precio,
    String moneda = 'USD',
    String? observaciones,
  }) async {
    final idExterno = const Uuid().v4();

    final payload = {
      "idExterno": idExterno,
      "nombre": nombre,
      "rucCi": rucCi,
      "contacto": {"nombre": cNombre, "telefono": cTelefono, "correo": cCorreo},
      "direccion": {"provincia": dProvincia, "ciudad": dCiudad, "detalle": dDetalle},
      "precioActual": precio,
      "moneda": moneda,
      "observaciones": observaciones,
    };

    final entity = _prepareLocalEntity(payload, precio, moneda);
    await local.upsert(entity);

    try {
      await remote.crear(payload);
    } catch (_) {
      entity.pendienteSync = true;
      await local.upsert(entity);
      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'POST',
        endpoint: '/clientes',
        payload: payload,
      );
    }
  }

  // ──────────────────────────────────────────────────────────────
  // EDITAR
  // ──────────────────────────────────────────────────────────────
  Future<void> editar({
    required String idExterno,
    required String nombre,
    String? rucCi,
    required String cNombre,
    required String cTelefono,
    String? cCorreo,
    required String dProvincia,
    required String dCiudad,
    required String dDetalle,
    required double precio,
    String moneda = 'USD',
    String? observaciones,
  }) async {
    final entity = await local.porIdExterno(idExterno);
    if (entity == null) return;

    final payload = {
      "nombre": nombre,
      "rucCi": rucCi,
      "contacto": {"nombre": cNombre, "telefono": cTelefono, "correo": cCorreo},
      "direccion": {"provincia": dProvincia, "ciudad": dCiudad, "detalle": dDetalle},
      "precioActual": precio,
      "moneda": moneda,
      "observaciones": observaciones,
    };

    // Actualizar objeto local
    entity
      ..nombre = nombre
      ..rucCi = rucCi
      ..contactoNombre = cNombre
      ..contactoTelefono = cTelefono
      ..contactoCorreo = cCorreo
      ..direccionProvincia = dProvincia
      ..direccionCiudad = dCiudad
      ..direccionDetalle = dDetalle
      ..precioActual = precio
      ..moneda = moneda
      ..observaciones = observaciones
      ..fechaActualizacion = DateTime.now();

    await local.upsert(entity);

    try {
      await remote.editar(idExterno, payload);
    } catch (_) {
      entity.pendienteSync = true;
      await local.upsert(entity);
      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'PATCH',
        endpoint: '/clientes/$idExterno',
        payload: payload,
      );
    }
  }

  // ──────────────────────────────────────────────────────────────
  // ELIMINAR
  // ──────────────────────────────────────────────────────────────
  // ──────────────────────────────────────────────────────────────
// ELIMINAR
// ──────────────────────────────────────────────────────────────
Future<void> eliminar(String idExterno) async {
  final entity = await local.porIdExterno(idExterno);
  if (entity == null) return;

  try {
    // Intentar borrar en el servidor
    await remote.eliminar(idExterno);
    
    // Si hay éxito, borramos físicamente de Isar para no ocupar espacio
    await local.isar.writeTxn(() async {
       final v = await local.porIdExterno(idExterno);
        if (v != null) await local.isar.clienteEntitys.delete(v.id);
    });
  } catch (e) {
    print('Error al eliminar remotamente, realizando borrado lógico: $e');
    entity.activo = false;
    entity.pendienteSync = true;
    
    await local.upsert(entity); // Guardamos el estado "Inactivo" localmente
    
    // Encolamos para cuando vuelva el internet
    await outbox.enqueue(
      idOperacion: const Uuid().v4(),
      metodo: 'DELETE',
      endpoint: '/clientes/$idExterno',
      payload: {"idExterno": idExterno},
    );
  }
}

  // ──────────────────────────────────────────────────────────────
  // REACTIVAR
  // ──────────────────────────────────────────────────────────────

Future<void> reactivar(String idExterno) async {
    try {
      // Solo llamamos al remoto (no hay lógica local para reactivar)
      await remote.reactivar(idExterno);

      // Opcional: actualizar local si tienes cache
      final existente = await local.porIdExterno(idExterno);
      if (existente != null) {
        existente.activo = true;
        existente.estado = 'Activo';
        await local.upsert(existente);
      }
    } catch (e) {
      rethrow;
    }
  }

  // ──────────────────────────────────────────────────────────────
  // MAPEADORES PRIVADOS
  // ──────────────────────────────────────────────────────────────

  ClienteEntity _mapToEntity(Map<String, dynamic> m) {
    final contacto = m['contacto'] as Map<String, dynamic>? ?? {};
    final direccion = m['direccion'] as Map<String, dynamic>? ?? {};
    final precio = m['precio'] as Map<String, dynamic>? ?? {};
    final saldo = m['saldo'] as Map<String, dynamic>? ?? {};

    return ClienteEntity()
      ..idExterno = m['idExterno']?.toString() ?? ''
      ..nombre = m['nombre']?.toString() ?? ''
      ..rucCi = m['rucCi']?.toString()
      ..contactoNombre = contacto['nombre']?.toString() ?? ''
      ..contactoTelefono = contacto['telefono']?.toString() ?? ''
      ..contactoCorreo = contacto['correo']?.toString()
      ..direccionProvincia = direccion['provincia']?.toString() ?? ''
      ..direccionCiudad = direccion['ciudad']?.toString() ?? ''
      ..direccionDetalle = direccion['detalle']?.toString() ?? ''
      ..precioActual = (precio['precioActual'] is num) ? (precio['precioActual'] as num).toDouble() : 0.0
      ..moneda = precio['moneda']?.toString() ?? 'USD'
      ..observaciones = m['observaciones']?.toString()
      ..activo = m['activo'] == true
      ..estado = (m['estado']?.toString() ?? 'Activo') // ← Fallback seguro
      ..pendienteSync = false
      ..fechaCreacion = DateTime.parse(m['fechaCreacion'] ?? DateTime.now().toIso8601String())
      ..fechaActualizacion = DateTime.parse(m['fechaActualizacion'] ?? DateTime.now().toIso8601String())
      ..saldoTotalPorCobrar = (saldo['totalPorCobrar'] as num?)?.toDouble() ?? 0.0
      ..saldoTotalCobrado = (saldo['totalCobrado'] as num?)?.toDouble() ?? 0.0
      ..saldoUltimaActualizacion = saldo['ultimaActualizacion'] != null 
          ? DateTime.parse(saldo['ultimaActualizacion']) 
          : null;
  }

  ClienteEntity _prepareLocalEntity(Map<String, dynamic> payload, double precio, String moneda) {
    final localData = Map<String, dynamic>.from(payload);
    localData['precio'] = {"precioActual": precio, "moneda": moneda};
    localData['saldo'] = {
    "totalPorCobrar": 0.0,
    "totalCobrado": 0.0,
    };
    localData['activo'] = true;
    localData['estado'] = 'Activo'; // ← ¡AQUÍ LA CLAVE!
    localData['fechaCreacion'] = DateTime.now().toIso8601String();
    localData['fechaActualizacion'] = DateTime.now().toIso8601String();
    return _mapToEntity(localData);
  }

  // En ClientesRepository
Future<bool> existeRucCi(String rucCi, {String? excluirIdExterno}) async {
    final rucTrim = rucCi.trim();
    if (rucTrim.isEmpty) return false;

    var query = local.isar.clienteEntitys.filter().rucCiEqualTo(rucTrim);

    if (excluirIdExterno != null) {
      query = query.not().idExternoEqualTo(excluirIdExterno);
    }

    final existente = await query.findFirst();
    return existente != null;
  }

}

