import 'package:banano_proyecto_app/features/vehiculos/data/repositories/vehiculos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/vehiculo_entity.dart';

class VehiculosController
    extends StateNotifier<AsyncValue<List<VehiculoEntity>>> {
  final VehiculosRepository repo;

  VehiculosController(this.repo) : super(const AsyncLoading()) {
    cargar();
  }

  Future<void> cargar() async {
    state = const AsyncLoading();
    try {
      final items = await repo.listar();
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
    await repo.editar(idExterno, placa, nombre, capacidadCajas, tipo, marca,
        modelo, anio, color, kilometrajeActual, estado, conductorAsignado,
        conductorAsignadoNombre);
    await cargar();

    // ✅ Señal de cambio
    state = AsyncData(state.valueOrNull ?? []);
  }

  Future<void> eliminar(String idExterno) async {
    await repo.eliminar(idExterno);
    await cargar();

    // ✅ Señal de cambio
    state = AsyncData(state.valueOrNull ?? []);
  }
}
