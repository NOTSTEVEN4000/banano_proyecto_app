import 'dart:convert';
import 'package:banano_proyecto_app/features/vehiculos/data/sources/vehiculos_local_source.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'outbox/outbox_repository.dart';

class SyncService {
  final OutboxRepository outbox;
  final Dio dio;
  final VehiculosLocalSource vehiculosLocal;

  SyncService({
    required this.outbox,
    required this.dio,
    required this.vehiculosLocal,
  });

  Future<bool> _hayInternet() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Future<void> syncNow() async {
    final conectado = await _hayInternet();
    if (!conectado) {
      throw Exception('No hay conexión a internet'); // <-- LANZA ERROR
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

        if (op.metodo == 'POST' || op.metodo == 'PATCH' || op.metodo == 'DELETE') {
          // Intentar extraer idExterno del payload o endpoint
          idExterno = payload['idExterno']?.toString();
          if (idExterno == null || idExterno.isEmpty) {
            // Para PATCH y DELETE, está en el endpoint
            final parts = op.endpoint.split('/');
            idExterno = parts.lastWhere((part) => part.isNotEmpty, orElse: () => '');
          }
        }

        if (idExterno != null && idExterno.isNotEmpty) {
          await vehiculosLocal.marcarSynced(idExterno);
        }
      } catch (e) {
        await outbox.marcarError(op.id, e.toString());
        rethrow; // Propagar error para que la página lo capture
      }
    }
  }
}