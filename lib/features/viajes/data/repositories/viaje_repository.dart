import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/agregar_carga_cajas_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/agregar_combustible_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/crear_viaje_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/entregar_viaje_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/registrar_insumos_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_carga_cajas_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_combustible_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_insumos_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/sources/viaje_local.source.dart';
import 'package:banano_proyecto_app/features/viajes/data/sources/viaje_remote_source.dart';
import 'package:banano_proyecto_app/sync/outbox/outbox_repository.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import '../models/viaje_entity.dart';

class ViajesRepository {
  final ViajesLocalSource local;
  final ViajesRemoteSource remote;
  final OutboxRepository outbox;

  ViajesRepository({
    required this.local,
    required this.remote,
    required this.outbox,
  });

  // ── LISTAR VIAJES COMPLETOS (principal + insumos + combustible) ───────────────────────────────────────────────
Future<List<ViajeEntity>> listarViajesCompletos({
    required String? rol,
    String fecha = '', 
  }) async {
    final bool esAdministrador = rol == 'ADMINISTRADOR';
    final String hoy = DateTime.now().toIso8601String().split('T')[0];
    
    // Si no se pasa fecha y es operador, usamos hoy.
    final String fechaFiltro = fecha.isEmpty ? hoy : fecha;

    print('=== INICIO listarViajesCompletos - Rol: $rol ===');

    List<Map<String, dynamic>> remoto = [];
    bool hayInternet = false;

    try {
      // 1. ELECCIÓN DE ENDPOINT SEGÚN ROL
      if (esAdministrador) {
        print('Llamando a historial completo (Admin)...');
        remoto = await remote.listarTodoHistorial(); // Nuevo Endpoint
      } else {
        print('Llamando a lista por fecha: $fechaFiltro (Operador)...');
        remoto = await remote.listarPorFecha(fechaFiltro);
      }
      
      hayInternet = true;
      print('Remotos cargados OK: ${remoto.length} viajes');

      // 2. LIMPIEZA DE LOCALES
      await local.isar.writeTxn(() async {
        // Obtenemos todos los locales que YA están sincronizados
        final sincronizados = await local.isar.viajeEntitys
            .filter()
            .pendienteSyncEqualTo(false)
            .findAll();
            
        for (final v in sincronizados) {
          await local.isar.viajeEntitys.delete(v.id);
        }
      });

      // 3. GUARDADO DE NUEVOS DATOS
      for (final m in remoto) {
        final idExterno = m['idExterno']?.toString() ?? '';
        if (idExterno.isEmpty) continue;

        final entity = ViajeEntity.fromJson(m)
          ..pendienteSync = false
          ..fechaActualizacion = DateTime.now();

        await local.upsert(entity);

        // Sincroniza sub-registros (insumos/combustible)
        await _sincronizarSubRegistros(idExterno);
      }
    } catch (e) {
      hayInternet = false;
      print('Error de red o servidor: $e');
    }

    // 4. RETORNO DE DATOS DESDE ISAR (FILTRO FINAL)
    List<ViajeEntity> viajesLocales;

    if (esAdministrador) {
      // El administrador ve todo lo que se descargó en Isar
      viajesLocales = await local.isar.viajeEntitys
          .where()
          .sortByFechaCreacionDesc()
          .findAll();
    } else {
      // El operador solo ve lo de la fecha solicitada o lo que tiene pendiente
      viajesLocales = await local.isar.viajeEntitys
          .filter()
          .group((q) => q.fechaEqualTo(fechaFiltro).or().pendienteSyncEqualTo(true))
          .and()
          .activoEqualTo(true)
          .sortByFechaCreacionDesc()
          .findAll();
    }

    print('Retornando ${viajesLocales.length} viajes para el rol $rol');
    return viajesLocales;
  }

  // Auxiliar: sincroniza insumos y combustible desde backend
  Future<void> _sincronizarSubRegistros(String viajeIdExterno) async {
    try {
      final insumosData = await remote.getInsumos(viajeIdExterno);
      if (insumosData != null) {
        final entity = ViajeInsumosEntity.fromJson(insumosData);
        await local.upsertInsumos(entity);
        print('Insumos sincronizados para $viajeIdExterno');
      }
    } catch (e) {
      print('No se sincronizaron insumos para $viajeIdExterno: $e');
    }

    try {
      final combustibleData = await remote.getCombustible(viajeIdExterno);
      for (final c in combustibleData) {
        final entity = ViajeCombustibleEntity.fromJson(c);
        await local.upsertCombustible(entity);
      }
      print('Combustible sincronizado para $viajeIdExterno (${combustibleData.length} registros)');
    } catch (e) {
      print('No se sincronizó combustible para $viajeIdExterno: $e');
    }
  }

  // ── CREAR VIAJE ───────────────────────────────────────────────────────
  Future<String> crear(CrearViajeDto dto, String empresaId, String uid) async {
  final idExternoLocal = 'via-${dto.fecha}-${DateTime.now().millisecondsSinceEpoch}';

  final entity = ViajeEntity()
    ..idExterno = idExternoLocal
    ..empresaId = empresaId
    ..fecha = dto.fecha
    ..tipo = TipoViaje.values.firstWhere((e) => e.name == dto.tipo)
    ..vehiculoIdExterno = dto.vehiculoIdExterno
    ..destinoTipo = dto.destino['tipoDestino'] as String
    ..haciendaIdExterno = dto.destino['haciendaIdExterno'] as String?
    ..clienteIdExterno = dto.destino['clienteIdExterno'] as String?
    ..descripcionDestino = dto.destino['descripcion'] as String?
    ..estado = EstadoViaje.CREADO
    ..activo = true
    ..creadoPor = uid
    ..actualizadoPor = uid
    ..fechaCreacion = DateTime.now()
    ..fechaActualizacion = DateTime.now()
    ..pendienteSync = true;

  // 1. Guardar local SIEMPRE (visible inmediatamente)
  await local.upsert(entity);
  print('Viaje creado localmente (pendienteSync = true)');

  // 2. Intentar sincronizar inmediatamente
  try {
    final response = await remote.crear(dto.toJson());
    final idExternoReal = response['data']?['idExterno'] as String? ?? idExternoLocal;

    entity.idExterno = idExternoReal;
    entity.pendienteSync = false;
    await local.upsert(entity);

    print('Sincronizado OK - ID final: $idExternoReal');
    return idExternoReal;
  } catch (e, stack) {
    print('ERROR AL CREAR VIAJE EN BACKEND: $e');
    print('Stack trace completo: $stack');

    // 3. Encolar en outbox
    await outbox.enqueue(
      idOperacion: const Uuid().v4(),
      metodo: 'POST',
      endpoint: '/viajes',
      payload: dto.toJson(),
    );

    MensajesGlobales.info(
      'Sin conexión. Viaje guardado localmente y marcado como pendiente de sincronización.'
    );

    return idExternoLocal;
  }
}

  // ── INICIAR VIAJE ─────────────────────────────────────────────────────
  Future<void> iniciar(String idExterno, String uid) async {
  final entity = await local.porIdExterno(idExterno);
  if (entity == null) throw Exception('Viaje no encontrado localmente');

  // Actualización local inmediata
  entity.estado = EstadoViaje.EN_RUTA;
  entity.fechaInicio = DateTime.now();
  entity.actualizadoPor = uid;
  entity.pendienteSync = true;
  
  // Forzamos el guardado y esperamos a que termine
  await local.upsert(entity); 

  try {
    await remote.iniciar(idExterno);
    entity.pendienteSync = false;
    await local.upsert(entity); // Guardamos de nuevo sin el flag de pendiente
  } catch (e) {
    // Si falla internet, el outbox se encarga, pero lo local YA se cambió a EN_RUTA
    await outbox.enqueue(
      idOperacion: const Uuid().v4(),
      metodo: 'PATCH',
      endpoint: '/viajes/$idExterno/iniciar',
      payload: {},
    );
  }
}
  // ── REGISTRAR INSUMOS ─────────────────────────────────────────────────
  Future<void> registrarInsumos(String viajeIdExterno, RegistrarInsumosDto dto, String uid) async {
    print('=== INICIO registrarInsumos para viaje: $viajeIdExterno ===');

    final normalizedItems = dto.items.map((item) {
      return {
        'insumo': (item['insumo'] as String).toUpperCase(),
        'cantidad': item['cantidad'],
      };
    }).toList();

    final normalizedDto = RegistrarInsumosDto(
      idExterno: dto.idExterno,
      haciendaIdExterno: dto.haciendaIdExterno,
      items: normalizedItems,
    );

    print('DTO normalizado (mayúsculas): ${normalizedDto.toJson()}');

    final idExterno = normalizedDto.idExterno ?? 'INS-${const Uuid().v4()}';

    final entity = ViajeInsumosEntity()
      ..idExterno = idExterno
      ..viajeIdExterno = viajeIdExterno
      ..haciendaIdExterno = normalizedDto.haciendaIdExterno
      ..items = normalizedDto.items.map((item) {
        final insumoItem = ItemInsumo();
        final insumoStr = item['insumo'] as String;

        insumoItem.insumo = InsumoTipo.values.firstWhere(
          (e) => e.name == insumoStr,
          orElse: () => throw Exception('Insumo inválido: "$insumoStr"'),
        );
        insumoItem.cantidad = item['cantidad'] as int;
        return insumoItem;
      }).toList()
      ..creadoPor = uid
      ..actualizadoPor = uid
      ..pendienteSync = true
      ..fechaCreacion = DateTime.now()
      ..fechaActualizacion = DateTime.now();

    await local.upsertInsumos(entity);
    print('Insumos guardados en local OK');

    try {
      await remote.registrarInsumos(viajeIdExterno, normalizedDto.toJson());
      print('BACKEND OK - Insumos sincronizados');
      entity.pendienteSync = false;
      await local.upsertInsumos(entity);
    } catch (e, stack) {
      print('ERROR AL REGISTRAR INSUMOS: $e');
      print('Stack: $stack');

      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'POST',
        endpoint: '/viajes/$viajeIdExterno/insumos',
        payload: normalizedDto.toJson(),
      );

      MensajesGlobales.error('Error al sincronizar insumos: $e');
    }
  }

  // ── ACTUALIZAR INSUMOS ─────────────────────────────────────────────────
  Future<void> actualizarInsumos(String viajeIdExterno, RegistrarInsumosDto dto, String uid) async {
    print('=== INICIO actualizarInsumos (PUT) para viaje: $viajeIdExterno ===');

    final normalizedItems = dto.items.map((item) {
      return {
        'insumo': (item['insumo'] as String).toUpperCase(),
        'cantidad': item['cantidad'],
      };
    }).toList();

    final normalizedDto = RegistrarInsumosDto(
      idExterno: dto.idExterno,
      haciendaIdExterno: dto.haciendaIdExterno,
      items: normalizedItems,
    );

    final entity = await local.getInsumosPorViaje(viajeIdExterno);
    if (entity == null) {
      await registrarInsumos(viajeIdExterno, normalizedDto, uid);
      return;
    }

    entity
      ..haciendaIdExterno = normalizedDto.haciendaIdExterno ?? entity.haciendaIdExterno
      ..items = normalizedDto.items.map((item) {
        final insumoItem = ItemInsumo();
        final insumoStr = item['insumo'] as String;
        insumoItem.insumo = InsumoTipo.values.firstWhere(
          (e) => e.name == insumoStr,
          orElse: () => throw Exception('Insumo inválido: "$insumoStr"'),
        );
        insumoItem.cantidad = item['cantidad'] as int;
        return insumoItem;
      }).toList()
      ..actualizadoPor = uid
      ..pendienteSync = true
      ..fechaActualizacion = DateTime.now();

    await local.upsertInsumos(entity);

    try {
      await remote.actualizarInsumos(viajeIdExterno, normalizedDto.toJson());
      entity.pendienteSync = false;
      await local.upsertInsumos(entity);
    } catch (e, stack) {
      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'PUT',
        endpoint: '/viajes/$viajeIdExterno/insumos',
        payload: normalizedDto.toJson(),
      );

      MensajesGlobales.error('Error al actualizar insumos');
    }
  }

  // ── AGREGAR CARGA CAJAS ───────────────────────────────────────────────
Future<void> agregarCargaCajas(String viajeIdExterno, AgregarCargaCajasDto dto, String uid) async {
  // 1. Asegurar que el ID Externo no sea nulo para que Isar lo encuentre luego
  final idCarga = dto.idExterno.isEmpty 
      ? 'CARG-${const Uuid().v4()}' 
      : dto.idExterno;

  final entity = ViajeCargaCajasEntity()
    ..idExterno = idCarga
    ..viajeIdExterno = viajeIdExterno
    ..proveedorIdExterno = dto.proveedorIdExterno
    ..haciendaIdExterno = dto.haciendaIdExterno
    ..cantidadCajas = dto.cantidadCajas
    ..costoCompraUnitario = dto.costoCompraUnitario
    ..moneda = 'USD'
    ..totalCompra = dto.cantidadCajas * dto.costoCompraUnitario
    ..clienteIdExterno = dto.clienteIdExterno
    ..precioVentaUnitario = dto.precioVentaUnitario
    ..totalVenta = dto.precioVentaUnitario != null ? dto.cantidadCajas * dto.precioVentaUnitario! : null
    ..creadoPor = uid
    ..actualizadoPor = uid
    ..fechaCreacion = DateTime.now() // Agregado para trazabilidad
    ..fechaActualizacion = DateTime.now()
    ..pendienteSync = true;

  // 2. Guardar en local (Asegúrate que local.upsertCargaCajas use writeTxn)
  await local.upsertCargaCajas(entity);

  try {
    // 3. Importante: Enviar el ID generado al remoto también
    final payload = dto.toJson();
    payload['idExterno'] = idCarga; 
    
    await remote.agregarCargaCajas(viajeIdExterno, payload);
    
    entity.pendienteSync = false;
    await local.upsertCargaCajas(entity);
  } catch (e) {
    await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'POST',
        endpoint: '/viajes/$viajeIdExterno/cargas-cajas',
        payload: dto.toJson(),
      );
  }
}

  // ── AGREGAR COMBUSTIBLE ───────────────────────────────────────────────
  Future<void> agregarCombustible(String viajeIdExterno, AgregarCombustibleDto dto, String uid) async {
    final idExterno = dto.idExterno ?? 'COMB-${const Uuid().v4()}';

    final entity = ViajeCombustibleEntity()
      ..idExterno = idExterno
      ..viajeIdExterno = viajeIdExterno
      ..fechaHora = dto.fechaHora
      ..montoUSD = dto.montoUSD
      ..litros = dto.litros
      ..detalle = dto.detalle
      ..creadoPor = uid
      ..actualizadoPor = uid
      ..pendienteSync = true
      ..fechaCreacion = DateTime.now()
      ..fechaActualizacion = DateTime.now();

    await local.upsertCombustible(entity);

    try {
      await remote.agregarCombustible(viajeIdExterno, dto.toJson());
      entity.pendienteSync = false;
      await local.upsertCombustible(entity);
    } catch (e) {
      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'POST',
        endpoint: '/viajes/$viajeIdExterno/combustible',
        payload: dto.toJson(),
      );
    }
  }

  // ── ENTREGAR VIAJE ────────────────────────────────────────────────────
  Future<void> entregar(String idExterno, EntregarViajeDto dto, String uid) async {
    final entity = await local.porIdExterno(idExterno);
    if (entity == null) return;

    entity.estado = EstadoViaje.ENTREGADO;
    entity.fechaFin = DateTime.now();
    if (dto.observacion != null) {
      entity.notas = '${entity.notas ?? ''}\n[ENTREGA] ${dto.observacion}';
    }
    entity.actualizadoPor = uid;
    entity.pendienteSync = true;
    await local.upsert(entity);

    try {
      await remote.entregar(idExterno, dto.toJson());
      entity.pendienteSync = false;
      await local.upsert(entity);
    } catch (_) {
      await outbox.enqueue(
        idOperacion: const Uuid().v4(),
        metodo: 'PATCH',
        endpoint: '/viajes/$idExterno/entregar',
        payload: dto.toJson(),
      );
    }
  }
}