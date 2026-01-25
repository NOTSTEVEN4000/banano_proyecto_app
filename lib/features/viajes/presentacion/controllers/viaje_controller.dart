import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/agregar_carga_cajas_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/agregar_combustible_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/crear_viaje_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/entregar_viaje_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/registrar_insumos_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/repositories/viaje_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViajesController extends StateNotifier<AsyncValue<List<ViajeEntity>>> {
  final ViajesRepository repo;
  final String? rol;

  ViajesController(this.repo, this.rol) : super(const AsyncLoading()) {
    cargarMisViajes();
  }

// En ViajesController
Future<void> cargarMisViajes() async {
  state = const AsyncLoading();
  try {
    // Si el rol es 'ADMINISTRADOR', pasamos fecha vacía para que el Repo traiga todo
    final viajes = await repo.listarViajesCompletos(
      rol: rol,
      fecha: rol == 'ADMINISTRADOR' ? '' : DateTime.now().toIso8601String().split('T')[0],
    );
    state = AsyncData(viajes);
  } catch (e, st) {
    state = AsyncError(e, st);
    MensajesGlobales.error('Error al cargar viajes');
  }
}

  Future<String> crear(CrearViajeDto dto) async {
    try {
      final uid = 'usuario_actual';
      final idExterno = await repo.crear(dto, 'empresa_001', uid);
      await cargarMisViajes();
      MensajesGlobales.exito('Viaje creado');
      return idExterno;
    } catch (e) {
      MensajesGlobales.error('Error al crear viaje: $e');
      rethrow;
    }
  }

  // Método para INICIAR viaje
  // lib/features/viajes/presentation/viajes_controller.dart

Future<void> iniciar(String idExterno) async {
  try {
    // 1. Buscar el viaje en el repositorio local
    final viaje = await repo.local.porIdExterno(idExterno);
    
    if (viaje == null) return;

    // 2. Si es de tipo CAJAS, verificar que tenga carga registrada
    if (viaje.tipo == TipoViaje.CAJAS) {
      final cargas = await repo.local.getCargasPorViaje(idExterno);
      
      // Validamos si la lista está vacía o si la suma de cajas es 0
      if (cargas.isEmpty || cargas.fold(0, (prev, element) => prev + element.cantidadCajas) <= 0) {
        MensajesGlobales.error('No puedes iniciar: Debes registrar la cantidad de cajas primero.');
        return; 
      }
    }

    final uid = 'usuario_actual'; 
    await repo.iniciar(idExterno, uid);
    await cargarMisViajes(); 
    MensajesGlobales.exito('Viaje iniciado');
  } catch (e) {
    MensajesGlobales.error('Error al iniciar viaje: $e');
  }
}

  // Método para ENTREGAR viaje
  Future<void> entregar(String idExterno, EntregarViajeDto dto) async {
    try {
      final uid = 'usuario_actual'; // Obtén de auth
      await repo.entregar(idExterno, dto, uid);
      await cargarMisViajes(); // Refresca lista
      MensajesGlobales.exito('Viaje entregado');
    } catch (e) {
      MensajesGlobales.error('Error al entregar viaje: $e');
      rethrow;
    }
  }

  Future<void> registrarInsumos(
    String idExterno,
    RegistrarInsumosDto dto,
  ) async {
    try {
      final uid = 'usuario_actual'; // Obtén de auth
      await repo.registrarInsumos(idExterno, dto, uid);
      await cargarMisViajes();
      MensajesGlobales.exito('Insumos registrados');
    } catch (e) {
      MensajesGlobales.error('Error al registrar insumos');
      rethrow;
    }
  }


  Future<void> actualizarInsumos(
    String idExterno,
    RegistrarInsumosDto dto,
  ) async {
    try {
      final uid = 'usuario_actual';
      await repo.actualizarInsumos(idExterno, dto, uid);
      await cargarMisViajes();
      MensajesGlobales.exito('Insumos actualizados');
    } catch (e) {
      MensajesGlobales.error('Error al actualizar insumos: $e');
      rethrow;
    }
  }

  Future<void> agregarCargaCajas(
    String idExterno,
    AgregarCargaCajasDto dto,
  ) async {
    try {
      final uid = 'usuario_actual';
      await repo.agregarCargaCajas(idExterno, dto, uid);
      await cargarMisViajes();
      MensajesGlobales.exito('Carga de cajas agregada');
    } catch (e) {
      MensajesGlobales.error('Error al agregar carga de cajas');
      rethrow;
    }
  }

  Future<void> agregarCombustible(
    String idExterno,
    AgregarCombustibleDto dto,
  ) async {
    try {
      final uid = 'usuario_actual';
      await repo.agregarCombustible(idExterno, dto, uid);
      await cargarMisViajes();
      MensajesGlobales.exito('Recarga de combustible agregada');
    } catch (e) {
      MensajesGlobales.error('Error al agregar combustible');
      rethrow;
    }
  }
}
