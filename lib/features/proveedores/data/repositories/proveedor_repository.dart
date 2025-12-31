// lib/features/proveedores/data/repositories/proveedor_repository.dart

import 'dart:convert' as core;

import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:banano_proyecto_app/features/proveedores/data/sources/proveedor_local.source.dart';
import 'package:banano_proyecto_app/features/proveedores/data/sources/proveedor_remote_source.dart';
import 'package:banano_proyecto_app/sync/outbox/outbox_repository.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

class ProveedorRepository {
  final ProveedorLocalSource local;
  final ProveedorRemoteSource remote;
  final OutboxRepository outbox;

  ProveedorRepository({
    required this.local,
    required this.remote,
    required this.outbox,
  });

  // ──────────────────────────────────────────────────────────────
  // LISTAR
  // ──────────────────────────────────────────────────────────────
  Future<List<ProveedorEntity>> listar({required String? rol}) async {
    final bool esAdministrador = rol == 'ADMINISTRADOR';
    List<Map<String, dynamic>> remoto = [];
    bool hayInternet = false;

    try {
      remoto = esAdministrador
          ? await remote.listarTodos()
          : await remote.listarActivos();

      hayInternet = true;

      // SI HAY INTERNET: LIMPIAR LOCALES NO PENDIENTES
      await local.isar.writeTxn(() async {
        final todosLocales = await local.isar.proveedorEntitys.where().findAll();
        for (final localP in todosLocales) {
          if (!localP.pendienteSync) {
            await local.isar.proveedorEntitys.delete(localP.id);
          }
        }
      });

      // Guardar los del servidor en local
      for (final m in remoto) {
        final idExterno = m['idExterno']?.toString() ?? '';
        if (idExterno.isEmpty) continue;
        final p = _mapToEntity(m);
        await local.upsert(p);
      }
    } catch (e) {
      hayInternet = false;
      print('Sin internet, usando datos locales para proveedores: $e');
    }

    if (hayInternet) {
      if (esAdministrador) {
        return await local.isar.proveedorEntitys.where().sortByNombre().findAll();
      } else {
        return await local.isar.proveedorEntitys
            .filter()
            .activoEqualTo(true)
            .sortByNombre()
            .findAll();
      }
    } else {
      // Sin internet
      if (esAdministrador) {
        return await local.isar.proveedorEntitys.where().sortByNombre().findAll();
      } else {
        return await local.isar.proveedorEntitys
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
    String tipo = 'HACIENDA',
    String? rucCi,
    required String contactoNombre,
    required String contactoTelefono,
    String? contactoCorreo,
    required String direccionProvincia,
    required String direccionCiudad,
    required String direccionDetalle,
    required double precioActual,
    String moneda = 'USD',
    double saldoPorPagar = 0.0,
    double saldoPagado = 0.0,
    String? formaPago,
    int? diasCredito,
    String? observaciones,
  }) async {
    final idExterno = const Uuid().v4();

    // Construcción exacta igual a tu JSON de prueba
    final payload = {
      "idExterno": idExterno,
      "nombre": nombre.trim(),
      "tipo": tipo,
      "rucCi": rucCi?.trim(),
      "contacto": {
        "nombre": contactoNombre.trim(),
        "telefono": contactoTelefono.trim(),
        "correo": contactoCorreo?.trim() ?? "",
      },
      "direccion": {
        "provincia": direccionProvincia,
        "ciudad": direccionCiudad,
        "detalle": direccionDetalle,
      },
      "precio": {
        "precioActual": precioActual,
        "moneda": moneda,
      },
      "saldo": {
        "totalPorPagar": saldoPorPagar,
        "totalPagado": saldoPagado,
      },
      "condiciones": {
        "formaPago": formaPago ?? "CONTADO",
        "diasCredito": diasCredito ?? 0,
        "moneda": moneda,
      },
      "observaciones": observaciones ?? "",
    };

    print('DEBUG PAYLOAD PROVEEDOR: $payload');

    final entity = _prepareLocalEntity(payload, precioActual, moneda);
    await local.upsert(entity);

    try {
      // En proveedor_repository.dart
      print('--- PAYLOAD ENVIADO DESDE FLUTTER ---');
      print(core.jsonEncode(payload)); // Importa 'dart:convert' como core
      await remote.crear(payload);
      
    } catch (_) {
      entity.pendienteSync = true;
      await local.upsert(entity);
      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'POST',
        endpoint: '/proveedores',
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
    String? tipo,
    String? rucCi,
    required String contactoNombre,
    required String contactoTelefono,
    String? contactoCorreo,
    required String direccionProvincia,
    required String direccionCiudad,
    required String direccionDetalle,
    required double precioActual,
    String moneda = 'USD',
    double? saldoPorPagar,
    double? saldoPagado,
    String? formaPago,
    int? diasCredito,
    String? observaciones,
  }) async {
    final entity = await local.porIdExterno(idExterno);
    if (entity == null) return;

    final payload = <String, dynamic>{
      if (nombre != entity.nombre) "nombre": nombre,
      if (tipo != null && tipo != entity.tipo) "tipo": tipo,
      if (rucCi != entity.rucCi) "rucCi": rucCi,
      "contacto": {
        if (contactoNombre != entity.contactoNombre) "nombre": contactoNombre,
        if (contactoTelefono != entity.contactoTelefono) "telefono": contactoTelefono,
        if (contactoCorreo != entity.contactoCorreo) "correo": contactoCorreo,
      },
      "direccion": {
        if (direccionProvincia != entity.direccionProvincia) "provincia": direccionProvincia,
        if (direccionCiudad != entity.direccionCiudad) "ciudad": direccionCiudad,
        if (direccionDetalle != entity.direccionDetalle) "detalle": direccionDetalle,
      },
      "precio": {
        "precioActual": precioActual,
        "moneda": moneda,
      },
      if (saldoPorPagar != null || saldoPagado != null)
        "saldo": {
          if (saldoPorPagar != null) "totalPorPagar": saldoPorPagar,
          if (saldoPagado != null) "totalPagado": saldoPagado,
        },
      if (formaPago != null || diasCredito != null)
        "condiciones": {
          if (formaPago != null) "formaPago": formaPago,
          if (diasCredito != null) "diasCredito": diasCredito,
          "moneda": moneda,
        },
      if (observaciones != entity.observaciones) "observaciones": observaciones,
    };

    // Actualizar local
    entity
      ..nombre = nombre
      ..tipo = tipo ?? entity.tipo
      ..rucCi = rucCi
      ..contactoNombre = contactoNombre
      ..contactoTelefono = contactoTelefono
      ..contactoCorreo = contactoCorreo
      ..direccionProvincia = direccionProvincia
      ..direccionCiudad = direccionCiudad
      ..direccionDetalle = direccionDetalle
      ..precioActual = precioActual
      ..moneda = moneda
      ..saldoPorPagar = saldoPorPagar ?? entity.saldoPorPagar
      ..saldoPagado = saldoPagado ?? entity.saldoPagado
      ..formaPago = formaPago ?? entity.formaPago
      ..diasCredito = diasCredito ?? entity.diasCredito
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
        endpoint: '/proveedores/$idExterno',
        payload: payload,
      );
    }
  }

  // ──────────────────────────────────────────────────────────────
  // ELIMINAR
  // ──────────────────────────────────────────────────────────────
  Future<void> eliminar(String idExterno) async {
    final entity = await local.porIdExterno(idExterno);
    if (entity == null) return;

    try {
      await remote.eliminar(idExterno);

      // Si éxito → borrar físicamente de local
      await local.isar.writeTxn(() async {
        final p = await local.porIdExterno(idExterno);
        if (p != null) await local.isar.proveedorEntitys.delete(p.id);
      });
    } catch (e) {
      print('Error al eliminar remotamente, borrado lógico: $e');
      entity.activo = false;
      entity.pendienteSync = true;
      await local.upsert(entity);

      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'DELETE',
        endpoint: '/proveedores/$idExterno',
        payload: {"idExterno": idExterno},
      );
    }
  }

  // ──────────────────────────────────────────────────────────────
  // REACTIVAR
  // ──────────────────────────────────────────────────────────────
  Future<void> reactivar(String idExterno) async {
    try {
      await remote.reactivar(idExterno);

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
  ProveedorEntity _mapToEntity(Map<String, dynamic> m) {
    final contacto = m['contacto'] as Map<String, dynamic>? ?? {};
    final direccion = m['direccion'] as Map<String, dynamic>? ?? {};
    final precio = m['precio'] as Map<String, dynamic>? ?? {};
    final saldo = m['saldo'] as Map<String, dynamic>? ?? {};
    final condiciones = m['condiciones'] as Map<String, dynamic>? ?? {};

    return ProveedorEntity()
      ..idExterno = m['idExterno']?.toString() ?? ''
      ..nombre = m['nombre']?.toString() ?? ''
      ..tipo = m['tipo']?.toString() ?? 'HACIENDA'
      ..rucCi = m['rucCi']?.toString()
      ..contactoNombre = contacto['nombre']?.toString() ?? ''
      ..contactoTelefono = contacto['telefono']?.toString() ?? ''
      ..contactoCorreo = contacto['correo']?.toString()
      ..direccionProvincia = direccion['provincia']?.toString() ?? ''
      ..direccionCiudad = direccion['ciudad']?.toString() ?? ''
      ..direccionDetalle = direccion['detalle']?.toString() ?? ''
      ..precioActual = (precio['precioActual'] is num) ? (precio['precioActual'] as num).toDouble() : 0.0
      ..moneda = precio['moneda']?.toString() ?? 'USD'
      ..saldoPorPagar = (saldo['totalPorPagar'] as num?)?.toDouble() ?? 0.0
      ..saldoPagado = (saldo['totalPagado'] as num?)?.toDouble() ?? 0.0
      ..formaPago = condiciones['formaPago']?.toString()
      ..diasCredito = condiciones['diasCredito'] as int?
      ..estado = m['estado']?.toString() ?? 'Activo'
      ..activo = m['activo'] == true
      ..observaciones = m['observaciones']?.toString()
      ..pendienteSync = false
      ..fechaCreacion = DateTime.parse(m['fechaCreacion'] ?? DateTime.now().toIso8601String())
      ..fechaActualizacion = DateTime.parse(m['fechaActualizacion'] ?? DateTime.now().toIso8601String());
  }

  ProveedorEntity _prepareLocalEntity(Map<String, dynamic> payload, double precioActual, String moneda) {
    final localData = Map<String, dynamic>.from(payload);
    localData['precio'] = {"precioActual": precioActual, "moneda": moneda};
    localData['saldo'] = {"totalPorPagar": 0.0, "totalPagado": 0.0};
    localData['activo'] = true;
    localData['estado'] = 'Activo';
    localData['fechaCreacion'] = DateTime.now().toIso8601String();
    localData['fechaActualizacion'] = DateTime.now().toIso8601String();
    return _mapToEntity(localData);
  }

  // Validación de duplicado RUC (opcional)
  Future<bool> existeRucCi(String rucCi, {String? excluirIdExterno}) async {
    final rucTrim = rucCi.trim();
    if (rucTrim.isEmpty) return false;

    var query = local.isar.proveedorEntitys.filter().rucCiEqualTo(rucTrim);

    if (excluirIdExterno != null) {
      query = query.not().idExternoEqualTo(excluirIdExterno);
    }

    final existente = await query.findFirst();
    return existente != null;
  }
}