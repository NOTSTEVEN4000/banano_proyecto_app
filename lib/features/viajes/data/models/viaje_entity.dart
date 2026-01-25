// lib/features/viajes/data/models/viaje_entity.dart
import 'package:isar/isar.dart';

part 'viaje_entity.g.dart';

enum TipoViaje { INSUMOS, CAJAS }
enum EstadoViaje { CREADO, EN_RUTA, ENTREGADO, ANULADO }
enum TipoDestino { HACIENDA, BODEGA, CLIENTE }

@collection
class ViajeEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String idExterno;

  late String empresaId;
  late String fecha; // 'YYYY-MM-DD'

  @Enumerated(EnumType.name)
  late TipoViaje tipo;

  @Enumerated(EnumType.name)
  late EstadoViaje estado;

  late String vehiculoIdExterno;

  late String destinoTipo;
  String? haciendaIdExterno;
  String? clienteIdExterno;
  String? descripcionDestino;

  DateTime? fechaInicio;
  DateTime? fechaFin;

  String? notas;

  late bool activo = true;
  String? creadoPor;
  String? actualizadoPor;

  late bool pendienteSync = false;

  late DateTime fechaCreacion;
  late DateTime fechaActualizacion;


  // --- Campos para Estadísticas (Añadir estos) ---
  int totalCajas = 0;
  double totalGastoCajas = 0.0; // Lo que le pagas al proveedor
  double totalVentaCajas = 0.0; // Lo que te paga el cliente
  // -----------------------------------------------

  // Constructor vacío → OBLIGATORIO para isar_generator
  ViajeEntity();

  // Constructor desde JSON (para sincronizar desde backend)
  ViajeEntity.fromJson(Map<String, dynamic> json) {
    idExterno = json['idExterno'] as String;
    empresaId = json['empresaId'] as String;
    fecha = json['fecha'] as String;
    tipo = TipoViaje.values.firstWhere((e) => e.name == json['tipo']);
    estado = EstadoViaje.values.firstWhere((e) => e.name == json['estado']);
    vehiculoIdExterno = json['vehiculoIdExterno'] as String;

    final destinoMap = json['destino'] as Map<String, dynamic>? ?? {};
    destinoTipo = destinoMap['tipoDestino'] as String? ?? 'HACIENDA';
    haciendaIdExterno = destinoMap['haciendaIdExterno'] as String?;
    clienteIdExterno = destinoMap['clienteIdExterno'] as String?;
    descripcionDestino = destinoMap['descripcion'] as String?;

    fechaInicio = json['fechaInicio'] != null ? DateTime.parse(json['fechaInicio']) : null;
    fechaFin = json['fechaFin'] != null ? DateTime.parse(json['fechaFin']) : null;

    notas = json['notas'] as String?;
    activo = json['activo'] as bool? ?? true;
    creadoPor = json['creadoPor'] as String?;
    actualizadoPor = json['actualizadoPor'] as String?;

    fechaCreacion = DateTime.parse(json['fechaCreacion'] ?? DateTime.now().toIso8601String());
    fechaActualizacion = DateTime.parse(json['fechaActualizacion'] ?? DateTime.now().toIso8601String());
  }
}

