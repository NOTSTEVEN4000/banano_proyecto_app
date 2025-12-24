class VehiculoDto {
  final String idExterno;
  final String placa;
  final String nombre;
  final int? capacidadCajas;
  final bool activo;
  final String tipo;
  final String marca;
  final String modelo;
  final int? anio;
  final String? color;
  final int? kilometrajeActual;
  final String? estado;
  final String? conductorAsignado;
  final String? conductorAsignadoNombre;

  VehiculoDto({
    required this.idExterno,
    required this.placa,
    required this.nombre,
    this.capacidadCajas,
    this.activo = true,
    required this.tipo,
    required this.marca,
    required this.modelo,
    this.anio,
    this.color,
    this.kilometrajeActual,
    this.estado,
    this.conductorAsignado,
    this.conductorAsignadoNombre,
  });

  factory VehiculoDto.fromJson(Map<String, dynamic> json) {
    return VehiculoDto(
      idExterno: json['idExterno'].toString(),
      placa: json['placa'].toString(),
      nombre: json['nombre'].toString(),
      capacidadCajas: json['capacidadCajas'] == null ? null : (json['capacidadCajas'] as num).toInt(),
      activo: json['activo'] == true,
      tipo: json['tipo'].toString(),
      marca: json['marca'].toString(),
      modelo: json['modelo'].toString(),
      anio: json['anio'] is int ? json['anio'] as int : null,
      color: json['color']?.toString(),
      kilometrajeActual: json['kilometrajeActual'] is int ? json['kilometrajeActual'] as int : null,
      estado: json['estado']?.toString(),
      conductorAsignado: json['conductorAsignado']?.toString(),
      conductorAsignadoNombre: json['conductorAsignadoNombre']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    "idExterno": idExterno,
        "placa": placa,
        "nombre": nombre,
        "capacidadCajas": capacidadCajas,
        "tipo": tipo,
        "marca": marca,
        "modelo": modelo,
        if (anio != null) "anio": anio,
        if (color != null && color!.isNotEmpty) "color": color,
        if (kilometrajeActual != null) "kilometrajeActual": kilometrajeActual,
        if (estado != null && estado!.isNotEmpty) "estado": estado,
        if (conductorAsignado != null) "conductorAsignado": conductorAsignado,
        if (conductorAsignadoNombre != null) "conductorAsignadoNombre": conductorAsignadoNombre,
  };
}
