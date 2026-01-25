import 'package:isar/isar.dart';

part 'viaje_combustible_entity.g.dart';

@collection
class ViajeCombustibleEntity {
  Id id = Isar.autoIncrement;

  late String idExterno;
  late String viajeIdExterno;

  late DateTime fechaHora;
  late double montoUSD;
  double? litros;
  String? detalle;

  String? creadoPor;
  String? actualizadoPor;

  late bool pendienteSync = false;

  late DateTime fechaCreacion;
  late DateTime fechaActualizacion;

  // Constructor vacío (obligatorio para Isar)
  ViajeCombustibleEntity();

  // Factory constructor fromJson (para sincronización desde backend)
  factory ViajeCombustibleEntity.fromJson(Map<String, dynamic> json) {
    return ViajeCombustibleEntity()
      ..idExterno = json['idExterno'] as String? ?? ''
      ..viajeIdExterno = json['viajeIdExterno'] as String? ?? ''
      ..fechaHora = _parseDate(json['fechaHora'])
      ..montoUSD = (json['montoUSD'] as num?)?.toDouble() ?? 0.0
      ..litros = (json['litros'] as num?)?.toDouble()
      ..detalle = json['detalle'] as String?
      ..creadoPor = json['creadoPor'] as String?
      ..actualizadoPor = json['actualizadoPor'] as String?
      ..pendienteSync = json['pendienteSync'] as bool? ?? false
      ..fechaCreacion = _parseDate(json['fechaCreacion'])
      ..fechaActualizacion = _parseDate(json['fechaActualizacion']);
  }

  // Helper para parsear fechas de forma segura
  static DateTime _parseDate(dynamic value) {
    if (value == null) return DateTime.now();
    try {
      return DateTime.parse(value as String);
    } catch (_) {
      return DateTime.now();
    }
  }
}