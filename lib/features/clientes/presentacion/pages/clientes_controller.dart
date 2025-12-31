import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/clientes/data/repositories/clientes_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientesController
    extends StateNotifier<AsyncValue<List<ClienteEntity>>> {
  final ClientesRepository repo;
  final String? rol;

  ClientesController(this.repo, this.rol) : super(const AsyncLoading()) {
    cargar();
  }

  /// Carga la lista de clientes desde el repositorio
  Future<void> cargar() async {
    state = const AsyncLoading();
    try {
      final items = await repo.listar(rol: rol);
      state = AsyncData(items);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Crea un nuevo cliente
  Future<void> crear({
    required String nombre,
    String? rucCi,
    required String cNombre,
    required String cTelefono,
    String? cCorreo,
    required String dProvincia,
    required String dCiudad,
    required String dDetalle,
    required double precio,
    String moneda = 'USD',
    String? observaciones,
  }) async {
    try {
      final ruc = rucCi?.trim() ?? '';

      // Validar RUC duplicado (offline)
      if (ruc.isNotEmpty) {
        final existe = await repo.existeRucCi(ruc);
        if (existe) {
          MensajesGlobales.advertencia('Ya existe un cliente con este RUC/CI');
          return;
        }
      }
      await repo.crear(
        nombre: nombre,
        rucCi: rucCi,
        cNombre: cNombre,
        cTelefono: cTelefono,
        cCorreo: cCorreo,
        dProvincia: dProvincia,
        dCiudad: dCiudad,
        dDetalle: dDetalle,
        precio: precio,
        moneda: moneda,
        observaciones: observaciones,
      );
      await cargar();
    } catch (e) {
      MensajesGlobales.error('Error al crear el cliente');
      rethrow;
    }
  }

Future<void> editar({
  required String idExterno,
  required String nombre,
  String? rucCi,
  required String cNombre,
  required String cTelefono,
  String? cCorreo,
  required String dProvincia,
  required String dCiudad,
  required String dDetalle,
  required double precio,
  String moneda = 'USD',
  String? observaciones,
}) async {
  try {
    final esAdministrador = rol == 'ADMINISTRADOR';

    // Obtener el cliente actual para comparar
    final clienteActual = await repo.local.porIdExterno(idExterno);
    if (clienteActual == null) throw Exception('Cliente no encontrado localmente');

    final rucAnterior = clienteActual.rucCi?.trim() ?? '';
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
          MensajesGlobales.advertencia('Ya existe otro cliente con este RUC/CI');
          return;
        }
      }
    }

    // ... resto del código (llamar a repo.editar, cargar, etc.)
    await repo.editar(
      idExterno: idExterno,
      nombre: nombre,
      rucCi: rucCi,
      cNombre: cNombre,
      cTelefono: cTelefono,
      cCorreo: cCorreo,
      dProvincia: dProvincia,
      dCiudad: dCiudad,
      dDetalle: dDetalle,
      precio: precio,
      moneda: moneda,
      observaciones: observaciones,
    );

    await cargar();
    MensajesGlobales.exito('Cliente actualizado correctamente');
  } catch (e) {
    MensajesGlobales.error('Error al editar el cliente: $e');
    rethrow;
  }
}

  /// Elimina (o desactiva) un cliente
  Future<void> eliminar(String idExterno) async {
    try {
      await repo.eliminar(idExterno);
      await cargar();
    } catch (e) {
      MensajesGlobales.error('No se pudo eliminar el cliente');
      rethrow;
    }
  }

  Future<void> reactivar(String idExterno) async {
    try {
      await repo.reactivar(idExterno);
      await cargar();
      MensajesGlobales.exito('Vehículo reactivado correctamente.');
    } catch (e) {
      // Manejar error
      MensajesGlobales.error(
        'Error al reactivar vehículo, comprueba tu conexión.',
      );
      rethrow;
    }
  }
}
