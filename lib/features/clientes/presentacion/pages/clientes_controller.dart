import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/clientes/data/repositories/clientes_repository.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientesController extends StateNotifier<AsyncValue<List<ClienteEntity>>> {
  final ClientesRepository repo;
  final String? rol;

  int _paginaActual = 1;
  bool _cargandoMas = false;
  bool _hayMasDatos = true;
  final int _limite = 50; // ← Aumentado a 50 para mejor UX

  String? _queryActual;
  bool? _soloActivosActual;

  bool get hayMasDatos => _hayMasDatos;

  ClientesController(this.repo, this.rol) : super(const AsyncLoading()) {
    cargar();
  }

  // Modificar cargar para recibir ambos filtros
  Future<void> cargar({String? query, bool? soloActivos}) async {
    // Si se pasan nuevos valores, los actualizamos; si no, mantenemos los que ya estaban
    _queryActual = query ?? _queryActual;
    _soloActivosActual = soloActivos; // Aquí sí sobreescribimos porque null significa "Todos"
    
    _paginaActual = 1;
    _hayMasDatos = true;
    state = const AsyncLoading();

    try {
      final lista = await repo.listarPaginado(
        pagina: _paginaActual,
        limite: _limite,
        rol: rol,
        search: _queryActual,
        soloActivos: _soloActivosActual, // <--- PASAR AL REPO
      );
      _hayMasDatos = lista.length == _limite; // ← Si devolvió menos, ya no hay más
      state = AsyncData(lista);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> cargarSiguientePagina() async {
    if (_cargandoMas || !_hayMasDatos) return;

    _cargandoMas = true;
    try {
      final nuevaPagina = _paginaActual + 1;
      final nuevosItems = await repo.listarPaginado(
        pagina: nuevaPagina,
        limite: _limite,
        rol: rol,
        search: _queryActual,
        soloActivos: _soloActivosActual, // <--- PASAR AQUÍ TAMBIÉN
      );

      if (nuevosItems.length < _limite) {
        _hayMasDatos = false; // ← ¡AQUÍ SE ACTUALIZA!
      }
      _paginaActual++;
      _paginaActual = nuevaPagina;

      if (nuevosItems.isEmpty) {
        _hayMasDatos = false;
      } else {
        _paginaActual = nuevaPagina;
        final listaActual = state.value ?? [];
        state = AsyncData([...listaActual, ...nuevosItems]);
      }
    } catch (e) {
      debugPrint("Error cargando más clientes: $e");
    } finally {
      _cargandoMas = false;
    }
  }

  // Actualizar el refresco para usar los filtros vigentes
  Future<void> forzarRefrescoTotal() async {
    state = const AsyncLoading();
    _paginaActual = 1;
    _hayMasDatos = true;

    try {
      final lista = await repo.listarPaginado(
        pagina: 1,
        limite: _limite,
        rol: rol,
        search: _queryActual,
        soloActivos: _soloActivosActual,
        forceRefresh: true, 
      );
      state = AsyncData(lista);
      MensajesGlobales.exito('Lista actualizada desde la nube');
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
      if (clienteActual == null)
        throw Exception('Cliente no encontrado localmente');

      final rucAnterior = clienteActual.rucCi?.trim() ?? '';
      final rucNuevo = (rucCi ?? '').trim();

      // Solo validar restricción si el RUC cambió
      if (rucNuevo != rucAnterior) {
        // Solo ADMIN puede cambiar el RUC
        if (!esAdministrador) {
          MensajesGlobales.advertencia(
            'Solo el administrador puede modificar el RUC/CI',
          );
          return;
        }

        // Validar duplicado (excluyendo el actual)
        if (rucNuevo.isNotEmpty) {
          final existe = await repo.existeRucCi(
            rucNuevo,
            excluirIdExterno: idExterno,
          );
          if (existe) {
            MensajesGlobales.advertencia(
              'Ya existe otro cliente con este RUC/CI',
            );
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
      MensajesGlobales.exito('Cliente reactivado correctamente.');
    } catch (e) {
      // Manejar error
      MensajesGlobales.error(
        'Error al reactivar cliente, comprueba tu conexión.',
      );
      rethrow;
    }
  }
}
