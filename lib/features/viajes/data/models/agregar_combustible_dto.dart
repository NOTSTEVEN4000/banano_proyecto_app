// lib/features/viajes/data/dto/agregar_combustible_dto.dart
class AgregarCombustibleDto {
  final String idExterno;
  final DateTime fechaHora;
  final double montoUSD;
  final double? litros;
  final String? detalle;

  AgregarCombustibleDto({
    required this.idExterno,
    required this.fechaHora,
    required this.montoUSD,
    this.litros,
    this.detalle,
  });

  Map<String, dynamic> toJson() => {
        'idExterno': idExterno,
        'fechaHora': fechaHora.toIso8601String(),
        'montoUSD': montoUSD,
        if (litros != null) 'litros': litros,
        if (detalle != null && detalle!.isNotEmpty) 'detalle': detalle,
      };
}