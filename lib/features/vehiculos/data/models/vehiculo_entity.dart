import 'package:isar/isar.dart';

part 'vehiculo_entity.g.dart';

@collection
class VehiculoEntity {
  Id id = Isar.autoIncrement;
  @Index(unique: true, replace: true) // ← ESTO ES CLAVE
  late String idExterno;
  late String placa;
  late String nombre;
  int? capacidadCajas;
  bool activo = true;
  late String tipo;
  late String marca;
  late String modelo;
  int? anio;
  String? color;
  int? kilometrajeActual;
  String? estado;
  String? conductorAsignado;
  String? conductorAsignadoNombre;
  late DateTime fechaCreacion;    
  late DateTime fechaActualizacion; 
  bool pendienteSync = false;
}


