// lib/features/viajes/data/models/viaje_carga_cajas_entity.dart
import 'package:isar/isar.dart';

part 'viaje_carga_cajas_entity.g.dart';

@collection
class ViajeCargaCajasEntity {
  Id id = Isar.autoIncrement;

  late String idExterno;
  late String viajeIdExterno;
  late String proveedorIdExterno;
  late String haciendaIdExterno;

  late int cantidadCajas;
  late double costoCompraUnitario;
  late String moneda; // 'USD'

  late double totalCompra;

  String? clienteIdExterno;
  double? precioVentaUnitario;
  double? totalVenta;
  double? utilidadBruta;

  String? creadoPor;
  String? actualizadoPor;

  late bool pendienteSync = false;

  late DateTime fechaCreacion;
  late DateTime fechaActualizacion;

  ViajeCargaCajasEntity(); // ← Constructor vacío

  // fromJson...
}