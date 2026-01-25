// lib/features/viajes/data/dto/agregar_carga_cajas_dto.dart
class AgregarCargaCajasDto {
  final String idExterno;
  final String proveedorIdExterno;
  final String haciendaIdExterno;
  final int cantidadCajas;
  final double costoCompraUnitario;
  final String? clienteIdExterno;
  final double? precioVentaUnitario;

  AgregarCargaCajasDto({
    required this.idExterno,
    required this.proveedorIdExterno,
    required this.haciendaIdExterno,
    required this.cantidadCajas,
    required this.costoCompraUnitario,
    this.clienteIdExterno,
    this.precioVentaUnitario,
  });

  Map<String, dynamic> toJson() => {
        'idExterno': idExterno,
        'proveedorIdExterno': proveedorIdExterno,
        'haciendaIdExterno': haciendaIdExterno,
        'cantidadCajas': cantidadCajas,
        'costoCompraUnitario': costoCompraUnitario,
        if (clienteIdExterno != null) 'clienteIdExterno': clienteIdExterno,
        if (precioVentaUnitario != null) 'precioVentaUnitario': precioVentaUnitario,
      };
}