import 'package:banano_proyecto_app/core/auth/role_manager.dart';
import 'package:banano_proyecto_app/core/connectivity/connectivity_service.dart';
import 'package:banano_proyecto_app/features/auth/data/models/session_entity.dart';
import 'package:banano_proyecto_app/features/vehiculos/data/models/vehiculo_entity.dart';
import 'package:banano_proyecto_app/features/vehiculos/presentacion/vehiculos_controller.dart';
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
final vehiculosControllerProvider =
    StateNotifierProvider<
      VehiculosController,
      AsyncValue<List<VehiculoEntity>>
    >((ref) {
      return VehiculosController(ref.read(vehiculosRepositoryProvider));
    });

// Sync service
final syncServiceProvider = Provider((ref) {
  final outbox = ref.read(outboxRepositoryProvider);
  final dio = ref.read(apiClientProvider).dio;
  final vehLocal = ref.read(vehiculosLocalProvider);

  return SyncService(outbox: outbox, dio: dio, vehiculosLocal: vehLocal);
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
  // IMPORTANTE: Observamos SOLO el outbox y cambios generales
  // NO dependemos directamente de vehiculosControllerProvider aquí
  // porque al eliminar, el vehículo desaparece y podría "engañar" al provider

  final outbox = ref.read(outboxRepositoryProvider);

  // PRIORIDAD MÁXIMA: Si hay ALGO en el outbox (creación, edición o ELIMINACIÓN)
  // → siempre hay pendientes, sin importar el estado de los vehículos
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
  return await isar.sessionEntitys.get(0); // id = 0
});

// Provider para el rol actual (string)
final currentRolProvider = Provider<String?>((ref) {
  final session = ref.watch(currentSessionProvider);
  return session.when(
    data: (s) => s?.rol,
    loading: () => null,
    error: (_, __) => null,
  );
});

// Provider booleano: ¿es administrador?
final esAdministradorProvider = Provider<bool>((ref) {
  final rol = ref.watch(currentRolProvider);
  return rol == 'ADMINISTRADOR';
});

// Provider booleano: ¿es operador?
final esOperadorProvider = Provider<bool>((ref) {
  final rol = ref.watch(currentRolProvider);
  return rol == 'OPERADOR';
});

// Provider que devuelve un RoleManager con el rol actual
final roleManagerProvider = Provider<RoleManager>((ref) {
  final sessionAsync = ref.watch(currentSessionProvider);

  final String? rol = sessionAsync.when(
    data: (session) => session?.rol,
    loading: () => null,
    error: (_, __) => null,
  );

  return RoleManager(rol);
});