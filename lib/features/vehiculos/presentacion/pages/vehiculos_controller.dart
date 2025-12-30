import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/repositories/vehiculos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/vehiculo_entity.dart';

class VehiculosController
  extends StateNotifier<AsyncValue<List<VehiculoEntity>>> {
  final VehiculosRepository repo;
  final String? rol; // ← Agregamos el rol

  VehiculosController(this.repo, this.rol) : super(const AsyncLoading()) {
    cargar();
  }

  Future<void> cargar() async {
    state = const AsyncLoading();
    try {
      final items = await repo.listar(rol: rol); // ← Pasamos el rol
      state = AsyncData(items);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> crear(
    String placa,
    String nombre,
    int? capacidadCajas,
    String tipo,
    String marca,
    String modelo,
    int? anio,
    String? color,
    int? kilometrajeActual,
    String? estado,
    String? conductorAsignado,
    String? conductorAsignadoNombre,
  ) async {
    await repo.crear(
      placa,
      nombre,
      capacidadCajas,
      tipo,
      marca,
      modelo,
      anio,
      color,
      kilometrajeActual,
      estado,
      conductorAsignado,
      conductorAsignadoNombre,
    );
    await cargar();
    state = AsyncData(state.valueOrNull ?? []);
  }

  Future<void> editar(
    String idExterno,
    String placa,
    String nombre,
    int? capacidadCajas,
    String tipo,
    String marca,
    String modelo,
    int? anio,
    String? color,
    int? kilometrajeActual,
    String? estado,
    String? conductorAsignado,
    String? conductorAsignadoNombre,
  ) async {
    await repo.editar(
      idExterno,
      placa,
      nombre,
      capacidadCajas,
      tipo,
      marca,
      modelo,
      anio,
      color,
      kilometrajeActual,
      estado,
      conductorAsignado,
      conductorAsignadoNombre,
    );
    await cargar();
    state = AsyncData(state.valueOrNull ?? []);
  }

  Future<void> eliminar(String idExterno) async {
    await repo.eliminar(idExterno);
    await cargar();
    state = AsyncData(state.valueOrNull ?? []);
  }

  Future<void> reactivar(String idExterno) async {
    try {
      await repo.reactivar(idExterno);
      await cargar();
      MensajesGlobales.exito('Vehículo reactivado correctamente.');
    } catch (e) {
      // Manejar error
      MensajesGlobales.error('Error al reactivar vehículo, comprueba tu conexión.');
    }
  } 
}