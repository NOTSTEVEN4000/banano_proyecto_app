// lib/features/proveedores/data/dto/proveedor_dto.dart

import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';

class ProveedorDto {
  final String idExterno;
  final String nombre;
  final String tipo;
  final String? rucCi;
  final Map<String, dynamic> contacto;
  final Map<String, dynamic> direccion;
  final Map<String, dynamic> precio;
  final Map<String, dynamic>? saldo;
  final Map<String, dynamic>? condiciones;
  final String estado;
  final bool activo;
  final String? observaciones;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;

  ProveedorDto({
    required this.idExterno,
    required this.nombre,
    this.tipo = 'HACIENDA',
    this.rucCi,
    required this.contacto,
    required this.direccion,
    required this.precio,
    this.saldo,
    this.condiciones,
    this.estado = 'Activo',
    this.activo = true,
    this.observaciones,
    required this.fechaCreacion,
    required this.fechaActualizacion,
  });

  factory ProveedorDto.fromJson(Map<String, dynamic> json) {
    return ProveedorDto(
      idExterno: json['idExterno'],
      nombre: json['nombre'],
      tipo: json['tipo'] ?? 'HACIENDA',
      rucCi: json['rucCi'],
      contacto: json['contacto'],
      direccion: json['direccion'],
      precio: json['precio'],
      saldo: json['saldo'],
      condiciones: json['condiciones'],
      estado: json['estado'] ?? 'Activo',
      activo: json['activo'] ?? true,
      observaciones: json['observaciones'],
      fechaCreacion: DateTime.parse(json['fechaCreacion']),
      fechaActualizacion: DateTime.parse(json['fechaActualizacion']),
    );
  }

  ProveedorEntity toEntity() {
    return ProveedorEntity()
      ..idExterno = idExterno
      ..nombre = nombre
      ..tipo = tipo
      ..rucCi = rucCi
      ..contactoNombre = contacto['nombre']
      ..contactoTelefono = contacto['telefono']
      ..contactoCorreo = contacto['correo']
      ..direccionProvincia = direccion['provincia']
      ..direccionCiudad = direccion['ciudad']
      ..direccionDetalle = direccion['detalle']
      ..precioActual = (precio['precioActual'] as num).toDouble()
      ..moneda = precio['moneda'] ?? 'USD'
      ..saldoPorPagar = (saldo?['totalPorPagar'] as num?)?.toDouble() ?? 0.0
      ..saldoPagado = (saldo?['totalPagado'] as num?)?.toDouble() ?? 0.0
      ..formaPago = condiciones?['formaPago']
      ..diasCredito = condiciones?['diasCredito'] as int?
      ..estado = estado
      ..activo = activo
      ..observaciones = observaciones
      ..fechaCreacion = fechaCreacion
      ..fechaActualizacion = fechaActualizacion;
  }
}