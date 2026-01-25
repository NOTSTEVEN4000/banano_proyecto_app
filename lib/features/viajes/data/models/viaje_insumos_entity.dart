import 'package:isar/isar.dart';

part 'viaje_insumos_entity.g.dart';

enum InsumoTipo { CARTON, FUNDA, CARTULINA }

@collection
class ViajeInsumosEntity {
  Id id = Isar.autoIncrement;

  late String idExterno;
  late String viajeIdExterno;
  late String haciendaIdExterno;

  @embedded
  List<ItemInsumo> items = [];

  String? creadoPor;
  String? actualizadoPor;

  late bool pendienteSync = false;

  late DateTime fechaCreacion;
  late DateTime fechaActualizacion;

  // Constructor vacío (obligatorio para Isar)
  ViajeInsumosEntity();

  // Factory constructor fromJson (para sincronización desde backend)
  factory ViajeInsumosEntity.fromJson(Map<String, dynamic> json) {
    return ViajeInsumosEntity()
      ..idExterno = json['idExterno'] as String? ?? 'INS-${DateTime.now().millisecondsSinceEpoch}'
      ..viajeIdExterno = json['viajeIdExterno'] as String? ?? ''
      ..haciendaIdExterno = json['haciendaIdExterno'] as String? ?? ''
      ..items = (json['items'] as List<dynamic>? ?? [])
          .map((itemJson) {
            final item = itemJson as Map<String, dynamic>;
            return ItemInsumo.fromJson(item);
          })
          .toList()
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

@embedded
class ItemInsumo {
  @Enumerated(EnumType.name)
  late InsumoTipo insumo;
  late int cantidad;

  // Constructor vacío
  ItemInsumo();

  // Factory fromJson para cada ítem
  factory ItemInsumo.fromJson(Map<String, dynamic> json) {
    return ItemInsumo()
      ..insumo = InsumoTipo.values.firstWhere(
        (e) => e.name == (json['insumo'] as String? ?? 'CARTON').toUpperCase(),
        orElse: () => InsumoTipo.CARTON,
      )
      ..cantidad = json['cantidad'] as int? ?? 0;
  }
}