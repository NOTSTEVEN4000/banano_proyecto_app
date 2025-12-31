import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/features/proveedores/data/repositories/proveedor_repository.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProveedoresController extends StateNotifier<AsyncValue<List<ProveedorEntity>>> {
  final ProveedorRepository repo;
  final String? rol;

  ProveedoresController(this.repo, this.rol) : super(const AsyncLoading()) {
    cargar();
  }

  /// Carga la lista de proveedores desde el repositorio
  Future<void> cargar() async {
    state = const AsyncLoading();
    try {
      final items = await repo.listar(rol: rol);
      state = AsyncData(items);
    } catch (e, st) {
      state = AsyncError(e, st);
      MensajesGlobales.error('Error al cargar proveedores');
    }
  }

  /// Crea un nuevo proveedor
  Future<void> crear({
    required String nombre,
    String tipo = 'HACIENDA',
    String? rucCi,
    required String contactoNombre,
    required String contactoTelefono,
    String? contactoCorreo,
    required String direccionProvincia,
    required String direccionCiudad,
    required String direccionDetalle,
    required double precioActual,
    String moneda = 'USD',
    double saldoPorPagar = 0.0,
    double saldoPagado = 0.0,
    String? formaPago,
    int? diasCredito,
    String? observaciones,
  }) async {
    try {
      final ruc = rucCi?.trim() ?? '';

      // Validar RUC duplicado (offline)
      if (ruc.isNotEmpty) {
        final existe = await repo.existeRucCi(ruc);
        if (existe) {
          MensajesGlobales.advertencia('Ya existe un proveedor con este RUC/CI');
          return;
        }
      }

      await repo.crear(
        nombre: nombre,
        tipo: tipo,
        rucCi: rucCi,
        contactoNombre: contactoNombre,
        contactoTelefono: contactoTelefono,
        contactoCorreo: contactoCorreo,
        direccionProvincia: direccionProvincia,
        direccionCiudad: direccionCiudad,
        direccionDetalle: direccionDetalle,
        precioActual: precioActual,
        moneda: moneda,
        saldoPorPagar: saldoPorPagar,
        saldoPagado: saldoPagado,
        formaPago: formaPago,
        diasCredito: diasCredito,
        observaciones: observaciones,
      );

      await cargar();
      MensajesGlobales.exito('Proveedor creado correctamente');
    } catch (e) {
      MensajesGlobales.error('Error al crear el proveedor');
      rethrow;
    }
  }

  /// Edita un proveedor existente
  Future<void> editar({
    required String idExterno,
    required String nombre,
    String? tipo,
    String? rucCi,
    required String contactoNombre,
    required String contactoTelefono,
    String? contactoCorreo,
    required String direccionProvincia,
    required String direccionCiudad,
    required String direccionDetalle,
    required double precioActual,
    String moneda = 'USD',
    double? saldoPorPagar,
    double? saldoPagado,
    String? formaPago,
    int? diasCredito,
    String? observaciones,
  }) async {
    try {
      final esAdministrador = rol == 'ADMINISTRADOR';

      // Obtener el proveedor actual para comparar
      final proveedorActual = await repo.local.porIdExterno(idExterno);
      if (proveedorActual == null) {
        throw Exception('Proveedor no encontrado localmente');
      }

      final rucAnterior = proveedorActual.rucCi?.trim() ?? '';
      final rucNuevo = (rucCi ?? '').trim();

      // Solo validar restricción si el RUC cambió
      if (rucNuevo != rucAnterior) {
        // Solo ADMIN puede cambiar el RUC
        if (!esAdministrador) {
          MensajesGlobales.advertencia('Solo el administrador puede modificar el RUC/CI');
          return;
        }

        // Validar duplicado (excluyendo el actual)
        if (rucNuevo.isNotEmpty) {
          final existe = await repo.existeRucCi(rucNuevo, excluirIdExterno: idExterno);
          if (existe) {
            MensajesGlobales.advertencia('Ya existe otro proveedor con este RUC/CI');
            return;
          }
        }
      }

      await repo.editar(
        idExterno: idExterno,
        nombre: nombre,
        tipo: tipo,
        rucCi: rucCi,
        contactoNombre: contactoNombre,
        contactoTelefono: contactoTelefono,
        contactoCorreo: contactoCorreo,
        direccionProvincia: direccionProvincia,
        direccionCiudad: direccionCiudad,
        direccionDetalle: direccionDetalle,
        precioActual: precioActual,
        moneda: moneda,
        saldoPorPagar: saldoPorPagar,
        saldoPagado: saldoPagado,
        formaPago: formaPago,
        diasCredito: diasCredito,
        observaciones: observaciones,
      );

      await cargar();
      MensajesGlobales.exito('Proveedor actualizado correctamente');
    } catch (e) {
      MensajesGlobales.error('Error al editar el proveedor');
      rethrow;
    }
  }

  /// Elimina (o desactiva) un proveedor
  Future<void> eliminar(String idExterno) async {
    try {
      await repo.eliminar(idExterno);
      await cargar();
      MensajesGlobales.advertencia('Proveedor eliminado localmente. Se sincronizará al tener internet.');
    } catch (e) {
      MensajesGlobales.error('No se pudo eliminar el proveedor');
      rethrow;
    }
  }

  /// Reactiva un proveedor eliminado
  Future<void> reactivar(String idExterno) async {
    try {
      await repo.reactivar(idExterno);
      await cargar();
      MensajesGlobales.exito('Proveedor reactivado correctamente');
    } catch (e) {
      MensajesGlobales.error('Error al reactivar el proveedor, compruebe su conexión a internet');
      rethrow;
    }
  }
}