import 'package:banano_proyecto_app/core/auth/role_manager.dart';
import 'package:banano_proyecto_app/core/connectivity/connectivity_service.dart';
import 'package:banano_proyecto_app/features/auth/data/models/session_entity.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/clientes/data/repositories/clientes_repository.dart';
import 'package:banano_proyecto_app/features/clientes/data/sources/clientes_local_source.dart';
import 'package:banano_proyecto_app/features/clientes/data/sources/clientes_remote_source.dart';
import 'package:banano_proyecto_app/features/clientes/presentacion/pages/clientes_controller.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:banano_proyecto_app/features/proveedores/data/repositories/proveedor_repository.dart';
import 'package:banano_proyecto_app/features/proveedores/data/sources/proveedor_local.source.dart';
import 'package:banano_proyecto_app/features/proveedores/data/sources/proveedor_remote_source.dart';
import 'package:banano_proyecto_app/features/proveedores/presentacion/controllers/proveedores_controller.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:banano_proyecto_app/features/vehiculos/presentacion/controllers/vehiculos_controller.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:banano_proyecto_app/features/viajes/data/repositories/viaje_repository.dart';
import 'package:banano_proyecto_app/features/viajes/data/sources/viaje_local.source.dart';
import 'package:banano_proyecto_app/features/viajes/data/sources/viaje_remote_source.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/controllers/viaje_controller.dart';
import 'package:banano_proyecto_app/sync/sync_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import 'package:banano_proyecto_app/core/storage/secure_storage.dart';
import 'package:banano_proyecto_app/core/network/api_client.dart';

import 'package:banano_proyecto_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:banano_proyecto_app/features/auth/presentacion/controllers/auth_controller.dart';
import 'package:banano_proyecto_app/features/auth/data/sources/auth_remote_source.dart';
import 'package:banano_proyecto_app/features/auth/data/repositories/auth_repository_impl.dart';

import 'package:banano_proyecto_app/sync/outbox/outbox_repository.dart';

import 'package:banano_proyecto_app/features/vehiculos/data/sources/vehiculos_remote_source.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/sources/vehiculos_local_source.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/repositories/vehiculos_repository.dart';

// =============================================================================
// 1. INFRAESTRUCTURA Y CORE (Isar, Storage, Network)
// =============================================================================

// Isar inyectado desde main.dart
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Isar no fue inyectado. Revisa main.dart');
});

final secureStoreProvider = Provider((ref) => SecureStore());

final apiClientProvider = Provider((ref) {
  final store = ref.read(secureStoreProvider);
  return ApiClient(store);
});

final internetConnectionProvider = StreamProvider<bool>((ref) {
  final connectivityService = ref.watch(connectivityServiceProvider);
  return connectivityService.connectionStream;
});

final temaProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

// =============================================================================
// 2. SESIÓN Y GESTIÓN DE ROLES
// =============================================================================

// Obtiene la sesión actual desde Isar
final currentSessionProvider = FutureProvider<SessionEntity?>((ref) async {
  final isar = ref.read(isarProvider);
  return await isar.sessionEntitys.where().findFirst(); 
});

// Expone el String del rol actual (útil para controladores)
final currentUserRoleProvider = Provider<String?>((ref) {
  final sessionAsync = ref.watch(currentSessionProvider);
  return sessionAsync.when(
    data: (session) => session?.rol,
    loading: () => null,
    error: (_, __) => null,
  );
});

// Manager de roles para lógica de permisos
final roleManagerProvider = Provider<RoleManager>((ref) {
  final rol = ref.watch(currentUserRoleProvider);
  return RoleManager(rol);
});

// =============================================================================
// 3. AUTENTICACIÓN
// =============================================================================

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(apiClientProvider).dio;
  final remote = AuthRemoteSource(dio);
  final secure = ref.read(secureStoreProvider);
  final isar = ref.read(isarProvider);
  return AuthRepositoryImpl(remote: remote, secure: secure, isar: isar);
});

final authControllerProvider = NotifierProvider<AuthController, AuthState>(() {
  return AuthController();
});

// =============================================================================
// 4. SINCRONIZACIÓN (Outbox & SyncService)
// =============================================================================

final outboxRepositoryProvider = Provider<OutboxRepository>((ref) {
  final isar = ref.read(isarProvider);
  return OutboxRepository(isar);
});

final syncServiceProvider = Provider((ref) {
  return SyncService(
    outbox: ref.read(outboxRepositoryProvider),
    dio: ref.read(apiClientProvider).dio,
    vehiculosLocal: ref.read(vehiculosLocalProvider),
    clientesLocal: ref.read(clientesLocalProvider),
    viajesLocal: ref.read(viajesLocalProvider),
    proveedoresLocal: ref.read(proveedoresLocalProvider),
  );
});

// Indica si hay algo pendiente de subir a la nube
final hayPendientesSyncProvider = FutureProvider<bool>((ref) async {
  final outbox = ref.read(outboxRepositoryProvider);
  final pendientesOutbox = await outbox.pendientes(limit: 1);
  if (pendientesOutbox.isNotEmpty) return true;

  final isar = ref.read(isarProvider);
  final countPendientesLocal = await isar.vehiculoEntitys
      .filter()
      .pendienteSyncEqualTo(true)
      .activoEqualTo(true)
      .count();

  return countPendientesLocal > 0;
});

// =============================================================================
// 5. MÓDULO: VEHÍCULOS
// =============================================================================

final vehiculosLocalProvider = Provider((ref) => VehiculosLocalSource(ref.read(isarProvider)));
final vehiculosRemoteProvider = Provider((ref) => VehiculosRemoteSource(ref.read(apiClientProvider).dio));

final vehiculosRepositoryProvider = Provider<VehiculosRepository>((ref) {
  return VehiculosRepository(
    local: ref.read(vehiculosLocalProvider),
    remote: ref.read(vehiculosRemoteProvider),
    outbox: ref.read(outboxRepositoryProvider),
  );
});

final vehiculosControllerProvider = StateNotifierProvider<VehiculosController, AsyncValue<List<VehiculoEntity>>>((ref) {
  final repo = ref.read(vehiculosRepositoryProvider);
  final rol = ref.watch(currentUserRoleProvider);
  return VehiculosController(repo, rol);
});

// =============================================================================
// 6. MÓDULO: CLIENTES
// =============================================================================

final clientesLocalProvider = Provider((ref) => ClientesLocalSource(ref.read(isarProvider)));
final clientesRemoteProvider = Provider((ref) => ClientesRemoteSource(ref.read(apiClientProvider).dio));

final clientesRepositoryProvider = Provider<ClientesRepository>((ref) {
  return ClientesRepository(
    local: ref.read(clientesLocalProvider),
    remote: ref.read(clientesRemoteProvider),
    outbox: ref.read(outboxRepositoryProvider),
  );
});

final clientesControllerProvider = StateNotifierProvider<ClientesController, AsyncValue<List<ClienteEntity>>>((ref) {
  final repo = ref.read(clientesRepositoryProvider);
  final rol = ref.watch(currentUserRoleProvider);
  return ClientesController(repo, rol);
});

// =============================================================================
// 7. MÓDULO: PROVEEDORES
// =============================================================================

final proveedoresLocalProvider = Provider((ref) => ProveedorLocalSource(ref.read(isarProvider)));
final proveedoresRemoteProvider = Provider((ref) => ProveedorRemoteSource(ref.read(apiClientProvider).dio));

final proveedoresRepositoryProvider = Provider<ProveedorRepository>((ref) {
  return ProveedorRepository(
    local: ref.read(proveedoresLocalProvider),
    remote: ref.read(proveedoresRemoteProvider),
    outbox: ref.read(outboxRepositoryProvider),
  );
});

final proveedoresControllerProvider = StateNotifierProvider<ProveedoresController, AsyncValue<List<ProveedorEntity>>>((ref) {
  final repo = ref.read(proveedoresRepositoryProvider);
  final rol = ref.watch(currentUserRoleProvider);
  return ProveedoresController(repo, rol);
});

// =============================================================================
// 8. MÓDULO: VIAJES (Controller & Repositories)
// =============================================================================

final viajesLocalProvider = Provider((ref) => ViajesLocalSource(ref.read(isarProvider)));
final viajesRemoteProvider = Provider((ref) => ViajesRemoteSource(ref.read(apiClientProvider).dio));

final viajesRepositoryProvider = Provider<ViajesRepository>((ref) {
  return ViajesRepository(
    local: ref.read(viajesLocalProvider),
    remote: ref.read(viajesRemoteProvider),
    outbox: ref.read(outboxRepositoryProvider),
  );
});

final viajesControllerProvider = StateNotifierProvider<ViajesController, AsyncValue<List<ViajeEntity>>>((ref) {
  final repo = ref.read(viajesRepositoryProvider);
  final rol = ref.watch(currentUserRoleProvider); 
  return ViajesController(repo, rol);
});

// =============================================================================
// 9. VIAJES: PROVIDERS DE DETALLES (Family Providers)
// =============================================================================

// Obtener un viaje específico
final viajeProvider = FutureProvider.family<ViajeEntity, String>((ref, idExterno) async {
  final repo = ref.watch(viajesRepositoryProvider);
  final viaje = await repo.local.porIdExterno(idExterno);
  if (viaje == null) throw Exception('Viaje no encontrado');
  return viaje;
});

// Cargas de cajas asociadas a un viaje
final cargasPorViajeProvider = FutureProvider.autoDispose.family<List<Map<String, dynamic>>, String>((ref, viajeIdExterno) async {
  final repo = ref.watch(viajesRepositoryProvider);
  final cargas = await repo.local.getCargasPorViaje(viajeIdExterno);

  return cargas.map((carga) => {
    'proveedor': carga.proveedorIdExterno,
    'hacienda': carga.haciendaIdExterno,
    'cliente': carga.clienteIdExterno ?? '—',
    'cajas': carga.cantidadCajas,
    'costoUnitario': carga.costoCompraUnitario,
    'totalCompra': carga.totalCompra,
    'venta': carga.totalVenta ?? 0.0,
    'utilidad': carga.utilidadBruta ?? 0.0,
  }).toList();
});

// Combustible asociado a un viaje
final combustiblePorViajeProvider = FutureProvider.family<List<Map<String, dynamic>>, String>((ref, viajeIdExterno) async {
  final repo = ref.watch(viajesRepositoryProvider);
  final combustibles = await repo.local.getCombustiblePorViaje(viajeIdExterno);

  return combustibles.map((comb) => {
    'fecha': comb.fechaHora.toString().split('.')[0],
    'monto': comb.montoUSD,
    'litros': comb.litros ?? 0,
    'detalle': comb.detalle ?? 'Sin detalle',
  }).toList();
});

// Insumos asociados a un viaje
final insumosPorViajeProvider = FutureProvider.family<List<Map<String, dynamic>>, String>((ref, viajeIdExterno) async {
  final repo = ref.watch(viajesRepositoryProvider);
  final insumosEntity = await repo.local.getInsumosPorViaje(viajeIdExterno);

  if (insumosEntity == null || insumosEntity.items.isEmpty) return [];

  return insumosEntity.items.map((item) => {
    'insumo': item.insumo.name.toUpperCase(),
    'cantidad': item.cantidad,
  }).toList();
});