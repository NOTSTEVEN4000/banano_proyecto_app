import 'dart:convert';
import 'package:banano_proyecto_app/features/clientes/data/sources/clientes_local_source.dart';
import 'package:banano_proyecto_app/features/proveedores/data/sources/proveedor_local.source.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/sources/vehiculos_local_source.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/agregar_combustible_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/registrar_insumos_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_carga_cajas_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_combustible_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_insumos_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/sources/viaje_local.source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import 'outbox/outbox_repository.dart';

class SyncService {
  final OutboxRepository outbox;
  final Dio dio;
  final VehiculosLocalSource vehiculosLocal;
  final ClientesLocalSource clientesLocal;
  final ViajesLocalSource viajesLocal;
  final ProveedorLocalSource proveedoresLocal;

  SyncService({
    required this.outbox,
    required this.dio,
    required this.vehiculosLocal,
    required this.clientesLocal,
    required this.viajesLocal,
    required this.proveedoresLocal,
  });

  Future<bool> _hayInternet() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Future<void> syncNow() async {
    final conectado = await _hayInternet();
    if (!conectado) {
      throw Exception('No hay conexión a internet');
    }

    await outbox.requeueErrores();

    final ops = await outbox.pendientes(limit: 50);

    if (ops.isEmpty) {
      // No hay nada que sincronizar
      return;
    }

    for (final op in ops) {
      await outbox.marcarEnviando(op.id);

      try {
        final payload = jsonDecode(op.payloadJson) as Map<String, dynamic>;

        await dio.request(
          op.endpoint,
          data: payload.isEmpty ? null : payload,
          options: Options(method: op.metodo),
        );

        await outbox.marcarOk(op.id);

        // Limpiar pendienteSync (para POST, PATCH, DELETE)
        String? idExterno;

        if (op.metodo == 'POST' ||
            op.metodo == 'PATCH' ||
            op.metodo == 'DELETE') {
          // Intentar extraer idExterno del payload o endpoint
          idExterno = payload['idExterno']?.toString();
          if (idExterno == null || idExterno.isEmpty) {
            // Para PATCH y DELETE, está en el endpoint
            idExterno = op.endpoint
                .split('/')
                .lastWhere((part) => part.isNotEmpty, orElse: () => '');
          }
        }

        if (idExterno != null && idExterno.isNotEmpty) {
          if (op.endpoint.contains('/vehiculos')) {
            await vehiculosLocal.marcarSynced(idExterno);
          } else if (op.endpoint.contains('/clientes')) {
            await clientesLocal.marcarSynced(idExterno);
          } else if (op.endpoint.contains('/proveedores')) {
            // <--- AGREGAR ESTE BLOQUE
            await proveedoresLocal.marcarSynced(idExterno);
            print('Proveedor marcado como sincronizado: $idExterno');
          } else if (op.endpoint.contains('/viajes')) {
            await _marcarViajeSynced(idExterno, op.endpoint);
          }
        }
      } catch (e) {
        await outbox.marcarError(op.id, e.toString());
        rethrow;
      }
    }

    // Después de procesar outbox, sincronizamos también registros locales pendientes
    await _sincronizarViajesPendientes();
  }

  // Nuevo: Marca como sincronizado un viaje o sus sub-registros según endpoint
  Future<void> _marcarViajeSynced(String idExterno, String endpoint) async {
    if (endpoint.contains('/insumos')) {
      final entity = await viajesLocal.getInsumosPorViaje(idExterno);
      if (entity != null) {
        entity.pendienteSync = false;
        await viajesLocal.isar.writeTxn(
          () => viajesLocal.isar.viajeInsumosEntitys.put(entity),
        );
        print('Insumos marcados como sincronizados: $idExterno');
      }
    } else if (endpoint.contains('/combustible')) {
      final entity = await viajesLocal.isar.viajeCombustibleEntitys
          .filter()
          .idExternoEqualTo(idExterno)
          .findFirst();
      if (entity != null) {
        entity.pendienteSync = false;
        await viajesLocal.isar.writeTxn(
          () => viajesLocal.isar.viajeCombustibleEntitys.put(entity),
        );
        print('Combustible marcado como sincronizado: $idExterno');
      }
    } else if (endpoint.contains('/cargas-cajas')) {
      final entity = await viajesLocal.isar.viajeCargaCajasEntitys
          .filter()
          .idExternoEqualTo(idExterno)
          .findFirst();
      if (entity != null) {
        entity.pendienteSync = false;
        await viajesLocal.isar.writeTxn(
          () => viajesLocal.isar.viajeCargaCajasEntitys.put(entity),
        );
        print('Carga de cajas marcada como sincronizada: $idExterno');
      }
    } else {
      // Para el viaje principal
      final entity = await viajesLocal.porIdExterno(idExterno);
      if (entity != null) {
        entity.pendienteSync = false;
        await viajesLocal.isar.writeTxn(
          () => viajesLocal.isar.viajeEntitys.put(entity),
        );
        print('Viaje principal marcado como sincronizado: $idExterno');
      }
    }
  }

  // Nuevo: Sincroniza registros locales pendientes de viajes (insumos, combustible, etc.)
  Future<void> _sincronizarViajesPendientes() async {
    // 1. Insumos pendientes
    final insumosPend = await viajesLocal.isar.viajeInsumosEntitys
        .filter()
        .pendienteSyncEqualTo(true)
        .findAll();

    for (final ins in insumosPend) {
      try {
        final dto = RegistrarInsumosDto(
          idExterno: ins.idExterno,
          haciendaIdExterno: ins.haciendaIdExterno,
          items: ins.items
              .map((it) => {'insumo': it.insumo.name, 'cantidad': it.cantidad})
              .toList(),
        );

        // Si ya existe → PUT, sino POST
        final existe = await dio.get('/viajes/${ins.viajeIdExterno}/insumos');
        if (existe.data['data'] != null) {
          await dio.put(
            '/viajes/${ins.viajeIdExterno}/insumos',
            data: dto.toJson(),
          );
        } else {
          await dio.post(
            '/viajes/${ins.viajeIdExterno}/insumos',
            data: dto.toJson(),
          );
        }

        ins.pendienteSync = false;
        await viajesLocal.isar.writeTxn(
          () => viajesLocal.isar.viajeInsumosEntitys.put(ins),
        );
        print('Insumos pendiente sincronizado: ${ins.idExterno}');
      } catch (e) {
        print('Error sincronizando insumos pendiente ${ins.idExterno}: $e');
      }
    }

    // 2. Combustible pendientes
    final combPend = await viajesLocal.isar.viajeCombustibleEntitys
        .filter()
        .pendienteSyncEqualTo(true)
        .findAll();

    for (final c in combPend) {
      try {
        final dto = AgregarCombustibleDto(
          idExterno: c.idExterno,
          fechaHora: c.fechaHora,
          montoUSD: c.montoUSD,
          litros: c.litros,
          detalle: c.detalle,
        );

        await dio.post(
          '/viajes/${c.viajeIdExterno}/combustible',
          data: dto.toJson(),
        );

        c.pendienteSync = false;
        await viajesLocal.isar.writeTxn(
          () => viajesLocal.isar.viajeCombustibleEntitys.put(c),
        );
        print('Combustible pendiente sincronizado: ${c.idExterno}');
      } catch (e) {
        print('Error sincronizando combustible pendiente ${c.idExterno}: $e');
      }
    }

    // 3. Puedes agregar aquí cargas de cajas, viajes principales, etc.
    // Ejemplo para viaje principal pendiente
    final viajesPend = await viajesLocal.isar.viajeEntitys
        .filter()
        .pendienteSyncEqualTo(true)
        .findAll();

    for (final v in viajesPend) {
      try {
        // Suponiendo que tienes un DTO para actualizar viaje
        // await dio.patch('/viajes/${v.idExterno}', data: ...);
        v.pendienteSync = false;
        await viajesLocal.isar.writeTxn(
          () => viajesLocal.isar.viajeEntitys.put(v),
        );
      } catch (e) {
        print('Error sincronizando viaje pendiente ${v.idExterno}: $e');
      }
    }
  }
}
