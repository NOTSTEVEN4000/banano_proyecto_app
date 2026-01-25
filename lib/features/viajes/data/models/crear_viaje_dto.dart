// data/dto/crear_viaje_dto.dart
class CrearViajeDto {
  final String fecha; // 'YYYY-MM-DD'
  final String tipo; // 'INSUMOS' | 'CAJAS'
  final String vehiculoIdExterno;
  final Map<String, dynamic> destino; // {tipoDestino, haciendaIdExterno?, clienteIdExterno?, descripcion?}
  final String? notas;

  CrearViajeDto({
    required this.fecha,
    required this.tipo,
    required this.vehiculoIdExterno,
    required this.destino,
    this.notas,
  });

  Map<String, dynamic> toJson() => {
        'fecha': fecha,
        'tipo': tipo,
        'vehiculoIdExterno': vehiculoIdExterno,
        'destino': destino,
        if (notas != null) 'notas': notas,
      };
}