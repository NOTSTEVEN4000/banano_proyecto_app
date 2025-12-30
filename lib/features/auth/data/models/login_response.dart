// models/login_response.dart
class LoginResponse {
  final String token;
  final String? usuarioId;
  final String? rol;
  final String? nombreCompleto;
  final String? correo;

  LoginResponse({
    required this.token,
    this.usuarioId,
    this.rol,
    this.nombreCompleto,
    this.correo,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final data = (json['data'] is Map<String, dynamic>)
        ? json['data'] as Map<String, dynamic>
        : json;

    final token = data['token'] as String?;
    if (token == null || token.isEmpty) {
      throw Exception('Respuesta sin token.');
    }

    final usuario = (data['usuario'] is Map<String, dynamic>)
        ? data['usuario'] as Map<String, dynamic>
        : null;

    // Extraer rol
    final rolesList = usuario?['roles'] as List<dynamic>?;
    final String? rol = rolesList?.isNotEmpty == true ? rolesList!.first.toString() : null;

    return LoginResponse(
      token: token,
      usuarioId: usuario?['_id']?.toString() ?? usuario?['id']?.toString(),
      rol: rol,
      nombreCompleto: usuario?['nombreCompleto']?.toString() ?? usuario?['nombre']?.toString(),
      correo: usuario?['correo']?.toString(),
    );
  }
}