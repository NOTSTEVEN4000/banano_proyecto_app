class LoginResponse {
  final String token;
  final String? usuarioId;
  final String? rol;

  LoginResponse({required this.token, this.usuarioId, this.rol});

  /// Soporta 2 formatos:
  /// A) { token: "...", usuario: {...} }
  /// B) { ok: true, data: { token: "...", usuario: {...} } }
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final data = (json['data'] is Map<String, dynamic>) ? json['data'] as Map<String, dynamic> : json;

    final token = data['token'] as String?;
    if (token == null || token.isEmpty) {
      throw Exception('Respuesta sin token.');
    }

    final usuario = (data['usuario'] is Map<String, dynamic>) ? data['usuario'] as Map<String, dynamic> : null;

    return LoginResponse(
      token: token,
      usuarioId: usuario?['id']?.toString(),
      rol: usuario?['rol']?.toString(),
    );
  }
}
