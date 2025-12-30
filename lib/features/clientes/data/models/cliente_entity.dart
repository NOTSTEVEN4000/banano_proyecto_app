import 'package:isar/isar.dart';

part 'cliente_entity.g.dart';

@collection
class ClienteEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String idExterno;

  late String nombre;
  
  @Index()
  String? rucCi;

  // Contacto
  late String contactoNombre;
  late String contactoTelefono;
  String? contactoCorreo;

  // Direccion
  late String direccionProvincia;
  late String direccionCiudad;
  late String direccionDetalle;

  // Precio
  late double precioActual;
  late String moneda;

  String? observaciones;
  bool activo = true;
  late String estado;

  late DateTime fechaCreacion;
  late DateTime fechaActualizacion;
  bool pendienteSync = false;

  // ← AQUÍ ESTABA FALTANDO: SALDO POR COBRAR
  double saldoTotalPorCobrar = 0.0;
  double saldoTotalCobrado = 0.0;
  DateTime? saldoUltimaActualizacion;
}