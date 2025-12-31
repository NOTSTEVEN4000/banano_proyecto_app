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
import 'package:banano_proyecto_app/features/proveedores/presentacion/pages/proveedores_controller.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:banano_proyecto_app/features/vehiculos/presentacion/pages/vehiculos_controller.dart';
import 'package:banano_proyecto_app/sync/sync_service.dart';
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

// ✅ Isar inyectado desde main.dart
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Isar no fue inyectado. Revisa main.dart');
});

final secureStoreProvider = Provider((ref) => SecureStore());

final apiClientProvider = Provider((ref) {
  final store = ref.read(secureStoreProvider);
  return ApiClient(store);
});

// -------------------- AUTH --------------------
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(apiClientProvider).dio;
  final remote = AuthRemoteSource(dio);
  final secure = ref.read(secureStoreProvider);
  final isar = ref.read(isarProvider);
  return AuthRepositoryImpl(remote: remote, secure: secure, isar: isar);
});

// En providers.dart - CAMBIA ESTO
final authControllerProvider = NotifierProvider<AuthController, AuthState>(() {
  return AuthController();
});

// Outbox
final outboxRepositoryProvider = Provider<OutboxRepository>((ref) {
  final isar = ref.read(isarProvider);
  return OutboxRepository(isar);
});

// Vehiculos: local
final vehiculosLocalProvider = Provider<VehiculosLocalSource>((ref) {
  final isar = ref.read(isarProvider);
  return VehiculosLocalSource(isar);
});

// Vehiculos: remote
final vehiculosRemoteProvider = Provider<VehiculosRemoteSource>((ref) {
  final dio = ref.read(apiClientProvider).dio;
  return VehiculosRemoteSource(dio);
});

// Vehiculos: repository
final vehiculosRepositoryProvider = Provider<VehiculosRepository>((ref) {
  return VehiculosRepository(
    local: ref.read(vehiculosLocalProvider),
    remote: ref.read(vehiculosRemoteProvider),
    outbox: ref.read(outboxRepositoryProvider),
  );
});

// Vehiculos: controller (AsyncValue<List<VehiculoEntity>>)
final vehiculosControllerProvider = StateNotifierProvider<VehiculosController, AsyncValue<List<VehiculoEntity>>>((ref) {
  final repo = ref.read(vehiculosRepositoryProvider);
  final rol = ref.watch(currentUserRoleProvider); // ← Obtenemos el rol aquí
  return VehiculosController(repo, rol);
});

// Sync service
final syncServiceProvider = Provider((ref) {
  final outbox = ref.read(outboxRepositoryProvider);
  final dio = ref.read(apiClientProvider).dio;
  final vehLocal = ref.read(vehiculosLocalProvider);
  final cliLocal = ref.read(clientesLocalProvider);

  return SyncService(outbox: outbox, dio: dio, vehiculosLocal: vehLocal, clientesLocal: cliLocal);
});

// providers.dart (al final del archivo)

// Provider que expone el estado de conexión como AsyncValue<bool>
final internetConnectionProvider = StreamProvider<bool>((ref) {
  final connectivityService = ref.watch(connectivityServiceProvider);
  return connectivityService.connectionStream;
});

// providers.dart

// Provider que indica si hay operaciones pendientes de sincronizar
final hayPendientesSyncProvider = FutureProvider<bool>((ref) async {
  final outbox = ref.read(outboxRepositoryProvider);
  final pendientesOutbox = await outbox.pendientes(limit: 1);
  if (pendientesOutbox.isNotEmpty) {
    return true;
  }

  // Secundario: vehículos activos con cambios locales pendientes
  final isar = ref.read(isarProvider);
  final countPendientesLocal = await isar.vehiculoEntitys
      .filter()
      .pendienteSyncEqualTo(true)
      .activoEqualTo(true)
      .count();

  return countPendientesLocal > 0;
});

// Provider para la sesión actual guardada en Isar

final currentSessionProvider = FutureProvider<SessionEntity?>((ref) async {
  final isar = ref.read(isarProvider);
  // En lugar de .get(0), usamos .findFirst()
  return await isar.sessionEntitys.where().findFirst(); 
});

// Provider que devuelve un RoleManager con el rol actual
final roleManagerProvider = Provider<RoleManager>((ref) {
  final sessionAsync = ref.watch(currentSessionProvider);

  final String? rol = sessionAsync.when(
    data: (session) => session?.rol,
    loading: () => null,
    error: (_, _) => null,
  );

  return RoleManager(rol);
});


// En providers.dart
final currentUserRoleProvider = Provider<String?>((ref) {
  final sessionAsync = ref.watch(currentSessionProvider);
  return sessionAsync.when(
    data: (session) => session?.rol,
    loading: () => null,
    error: (_, _) => null,
  );
});






/////////////////////////////////////////////////////////////////////
///CLIENTES
/////////////////////////////////////////////////////////////////////
///
/// Provider del repositorio de clientes

// --- CLIENTES ---

// Clientes: local
final clientesLocalProvider = Provider<ClientesLocalSource>((ref) {
  final isar = ref.read(isarProvider);
  return ClientesLocalSource(isar);
});

// Clientes: remote
final clientesRemoteProvider = Provider<ClientesRemoteSource>((ref) {
  final dio = ref.read(apiClientProvider).dio;
  return ClientesRemoteSource(dio);
});

// Clientes: repository
final clientesRepositoryProvider = Provider<ClientesRepository>((ref) {
  return ClientesRepository(
    local: ref.read(clientesLocalProvider),
    remote: ref.read(clientesRemoteProvider),
    outbox: ref.read(outboxRepositoryProvider),
  );
});

// Clientes: controller
final clientesControllerProvider = StateNotifierProvider<ClientesController, AsyncValue<List<ClienteEntity>>>((ref) {
  final repo = ref.read(clientesRepositoryProvider);
  final rol = ref.watch(currentUserRoleProvider);
  return ClientesController(repo, rol);
});


///////////////////////////////////
///
/// Proveedores
/// 
//////////////////////////////////
///

// Local
final proveedoresLocalProvider = Provider<ProveedorLocalSource>((ref) {
  final isar = ref.read(isarProvider);
  return ProveedorLocalSource(isar);
});

// Remote
final proveedoresRemoteProvider = Provider<ProveedorRemoteSource>((ref) {
  final dio = ref.read(apiClientProvider).dio;
  return ProveedorRemoteSource(dio);
});

// Repository
final proveedoresRepositoryProvider = Provider<ProveedorRepository>((ref) {
  return ProveedorRepository(
    local: ref.read(proveedoresLocalProvider),
    remote: ref.read(proveedoresRemoteProvider),
    outbox: ref.read(outboxRepositoryProvider),
  );
});

// Controller
final proveedoresControllerProvider = StateNotifierProvider<ProveedoresController, AsyncValue<List<ProveedorEntity>>>((ref) {
  final repo = ref.read(proveedoresRepositoryProvider);
  final rol = ref.watch(currentUserRoleProvider);
  return ProveedoresController(repo, rol);
});