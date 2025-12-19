import 'package:banano_proyecto_app/core/storage/secure_storage.dart';
import 'package:banano_proyecto_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:banano_proyecto_app/features/auth/presentacion/controllers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../core/network/api_client.dart';
import '../features/auth/data/sources/auth_remote_source.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';

// ✅ Isar ahora será inyectado desde main.dart (overrideWithValue)
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Isar no fue inyectado. Revisa main.dart');
});

final secureStoreProvider = Provider((ref) => SecureStore());

final apiClientProvider = Provider((ref) {
  final store = ref.read(secureStoreProvider);
  return ApiClient(store);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(apiClientProvider).dio;
  final remote = AuthRemoteSource(dio);
  final secure = ref.read(secureStoreProvider);
  final isar = ref.read(isarProvider);

  return AuthRepositoryImpl(remote: remote, secure: secure, isar: isar);
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return AuthController(repo);
});
