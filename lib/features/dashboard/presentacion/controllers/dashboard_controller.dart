import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banano_proyecto_app/di/providers.dart';

class DashboardStats {
  final double porPagar;
  final double porCobrar;
  final int viajesHoy;
  final int cajasMes;

  DashboardStats({
    this.porPagar = 0,
    this.porCobrar = 0,
    this.viajesHoy = 0,
    this.cajasMes = 0,
  });
}

final dashboardStatsProvider = FutureProvider.autoDispose<DashboardStats>((ref) async {
  final remoteViajes = ref.read(viajesRemoteProvider);
  final remoteProveedores = ref.read(proveedoresRemoteProvider);
  
  final fechaHoy = DateFormat('yyyy-MM-dd').format(DateTime.now());

  try {
    final response = await remoteViajes.listarPorFecha(fechaHoy);
    
    // DETECCIÓN DINÁMICA DE FORMATO
    List<dynamic> viajesJson = [];
    
    // El tipo de response siempre será List, no es necesario el type check
    viajesJson = response;

    double totalPagar = 0;
    double totalCobrar = 0;
    int vHoy = 0;
    int cMes = 0;

    for (var v in viajesJson) {
      if (v['estado'] == 'ANULADO') continue;

      // Usamos .toString() para asegurar que no haya errores si el ID es un ObjectId de Mongo
      final String? idHacienda = v['proveedorId']?.toString();
      final String? idCliente = v['clienteId']?.toString();

      if (idHacienda == null || idCliente == null) continue;

      try {
        vHoy++;
        // Consultamos precios actuales de la base de datos
        final datosHacienda = await remoteProveedores.obtenerPorId(idHacienda);
        final datosCliente = await remoteProveedores.obtenerPorId(idCliente);

        // Acceso seguro al precioActual
        final pProv = datosHacienda['precio']?['precioActual']?.toDouble() ?? 0.0;
        final pClie = datosCliente['precio']?['precioActual']?.toDouble() ?? 0.0;

        final cargas = v['cargasCajas'] as List? ?? [];
        for (var carga in cargas) {
          final cant = (carga['cantidadCajas'] ?? 0) as int;
          cMes += cant;
          totalPagar += (cant * pProv);
          totalCobrar += (cant * pClie);
        }
      } catch (e) {
        debugPrint("Error obteniendo precios de proveedores: $e");
      }
    }

    return DashboardStats(
      porPagar: totalPagar,
      porCobrar: totalCobrar,
      viajesHoy: vHoy,
      cajasMes: cMes,
    );
  } catch (e) {
    debugPrint("🚨 Error crítico final: $e");
    return DashboardStats(porPagar: 0, porCobrar: 0, viajesHoy: 0, cajasMes: 0);
  }
});