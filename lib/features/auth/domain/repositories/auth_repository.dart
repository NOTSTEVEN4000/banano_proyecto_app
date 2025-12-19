

import 'package:banano_proyecto_app/features/auth/data/models/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(String entrada, String clave);
  Future<void> logout();
  Future<bool> hasSession();
}
