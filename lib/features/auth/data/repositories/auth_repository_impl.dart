import 'package:banano_proyecto_app/core/storage/secure_storage.dart';
import 'package:banano_proyecto_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:isar/isar.dart';

import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/session_entity.dart';
import '../sources/auth_remote_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource remote;
  final SecureStore secure;
  final Isar isar;

  AuthRepositoryImpl({required this.remote, required this.secure, required this.isar});

  @override
  Future<LoginResponse> login(String entrada, String clave) async {
    final resp = await remote.login(LoginRequest(entrada: entrada, clave: clave));
    await secure.saveToken(resp.token);

    await isar.writeTxn(() async {
      final s = SessionEntity()
        ..id = 0
        ..token = resp.token
        ..usuarioId = resp.usuarioId
        ..rol = resp.rol
        ..creadoEn = DateTime.now();
      await isar.sessionEntitys.put(s);
    });

    return resp;
  }

  @override
  Future<void> logout() async {
    await secure.clearToken();
    await isar.writeTxn(() async {
      await isar.sessionEntitys.delete(0);
    });
  }

  @override
  Future<bool> hasSession() async {
    final token = await secure.readToken();
    return token != null && token.isNotEmpty;
  }
}
