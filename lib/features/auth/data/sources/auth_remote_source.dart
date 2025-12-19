import 'package:dio/dio.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

class AuthRemoteSource {
  final Dio dio;
  AuthRemoteSource(this.dio);

  Future<LoginResponse> login(LoginRequest req) async {
    final res = await dio.post('/auth/login', data: req.toJson());

    final data = (res.data is Map<String, dynamic>)
        ? res.data as Map<String, dynamic>
        : <String, dynamic>{};

    // ✅ Regla robusta: si existe token -> login OK
    final token = _extraerToken(data);
    if (token != null && token.isNotEmpty) {
      return LoginResponse.fromJson(data);
    }

    // Si no hay token, es error (bloqueado, credenciales, etc.)
    final msg = (data['mensaje'] ?? 'No se pudo iniciar sesión.').toString();
    final status = (data['statusCode'] ?? res.statusCode ?? 0) as int;
    throw AuthException(statusCode: status, message: msg);
  }

  String? _extraerToken(Map<String, dynamic> json) {
    // Soporta:
    // { token: "..." }
    // { data: { token: "..." } }
    if (json['token'] is String) return json['token'] as String;
    final d = json['data'];
    if (d is Map<String, dynamic> && d['token'] is String) return d['token'] as String;
    return null;
  }
}

class AuthException implements Exception {
  final int statusCode;
  final String message;
  AuthException({required this.statusCode, required this.message});

  bool get isBloqueado =>
      (statusCode == 403) || message.toLowerCase().contains('bloqueado');

  @override
  String toString() => message;
}
