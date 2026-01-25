// lib/features/viajes/data/dto/entregar_viaje_dto.dart
class EntregarViajeDto {
  final String? observacion;

  EntregarViajeDto({this.observacion});

  Map<String, dynamic> toJson() => {
        if (observacion != null && observacion!.isNotEmpty) 'observacion': observacion,
      };
}