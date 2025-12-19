import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore {
  static const _kToken = 'auth_token';
  final FlutterSecureStorage _s = const FlutterSecureStorage();

  Future<void> saveToken(String token) => _s.write(key: _kToken, value: token);
  Future<String?> readToken() => _s.read(key: _kToken);
  Future<void> clearToken() => _s.delete(key: _kToken);
}
