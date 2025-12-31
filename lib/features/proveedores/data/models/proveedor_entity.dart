// lib/features/proveedores/data/models/proveedor_entity.dart

import 'package:isar/isar.dart';

part 'proveedor_entity.g.dart';

@collection
class ProveedorEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String idExterno;

  late String nombre;
  String tipo = 'HACIENDA';

  String? rucCi;

  // Contacto
  late String contactoNombre;
  late String contactoTelefono;
  String? contactoCorreo;

  // Dirección
  late String direccionProvincia;
  late String direccionCiudad;
  late String direccionDetalle;

  // Precio
  late double precioActual;
  late String moneda = 'USD';

  // Saldo
  double saldoPorPagar = 0.0;
  double saldoPagado = 0.0;

  // Condiciones
  String? formaPago;
  int? diasCredito;

  String estado = 'Activo';
  bool activo = true;

  String? observaciones;

  // Sync
  bool pendienteSync = false;

  // Fechas
  late DateTime fechaCreacion;
  late DateTime fechaActualizacion;

  // Métodos útiles
  String get precioFormateado => '$precioActual $moneda';
  String get saldoFormateado => saldoPorPagar > 0 ? '-$saldoPorPagar $moneda' : '0 $moneda';
}