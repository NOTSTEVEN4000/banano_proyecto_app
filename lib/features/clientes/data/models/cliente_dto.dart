class ClienteDto {
  final String idExterno;
  final String nombre;
  final String? rucCi;
  final ContactoDto contacto;
  final DireccionDto direccion;
  final double precioActual;
  final String moneda;
  final String? observaciones;
  final bool activo;
  final String estado;

  ClienteDto({
    required this.idExterno,
    required this.nombre,
    this.rucCi,
    required this.contacto,
    required this.direccion,
    required this.precioActual,
    this.moneda = 'USD',
    this.observaciones,
    this.activo = true,
    this.estado = 'Activo',
  });

  factory ClienteDto.fromJson(Map<String, dynamic> json) {
    // Manejo del objeto anidado de precio que viene del backend
    final precioData = json['precio'] ?? {};
    
    return ClienteDto(
      idExterno: json['idExterno'].toString(),
      nombre: json['nombre'].toString(),
      rucCi: json['rucCi']?.toString(),
      contacto: ContactoDto.fromJson(json['contacto'] ?? {}),
      direccion: DireccionDto.fromJson(json['direccion'] ?? {}),
      precioActual: (precioData['precioActual'] as num?)?.toDouble() ?? 0.0,
      moneda: precioData['moneda']?.toString() ?? 'USD',
      observaciones: json['observaciones']?.toString(),
      activo: json['activo'] == true,
      estado: json['estado']?.toString() ?? 'Activo',
    );
  }
}

class ContactoDto {
  final String nombre;
  final String telefono;
  final String? correo;

  ContactoDto({required this.nombre, required this.telefono, this.correo});

  factory ContactoDto.fromJson(Map<String, dynamic> json) => ContactoDto(
    nombre: json['nombre']?.toString() ?? '',
    telefono: json['telefono']?.toString() ?? '',
    correo: json['correo']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    "nombre": nombre,
    "telefono": telefono,
    if (correo != null) "correo": correo,
  };
}

class DireccionDto {
  final String provincia;
  final String ciudad;
  final String detalle;

  DireccionDto({required this.provincia, required this.ciudad, required this.detalle});

  factory DireccionDto.fromJson(Map<String, dynamic> json) => DireccionDto(
    provincia: json['provincia']?.toString() ?? '',
    ciudad: json['ciudad']?.toString() ?? '',
    detalle: json['detalle']?.toString() ?? '',
  );

  Map<String, dynamic> toJson() => {
    "provincia": provincia,
    "ciudad": ciudad,
    "detalle": detalle,
  };
}