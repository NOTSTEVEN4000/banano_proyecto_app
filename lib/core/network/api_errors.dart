import 'package:dio/dio.dart';

class ApiError {
  final String mensaje;
  final String? detalle;
  final int? statusCode;

  ApiError({
    required this.mensaje,
    this.detalle,
    this.statusCode,
  });
}

ApiError mapError(Object error) {
  // 🔴 ERRORES DE DIO
  if (error is DioException) {
    // ❌ Sin conexión / servidor apagado
    if (error.type == DioExceptionType.connectionError) {
      return ApiError(
        mensaje: 'No se puede conectar al servidor.',
        detalle: 'Verifica que la API esté encendida y tu conexión activa.',
      );
    }

    // ⏱️ Timeout
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return ApiError(
        mensaje: 'Tiempo de espera agotado.',
        detalle: 'La conexión tardó demasiado.',
      );
    }

    // 📩 Respuesta del backend
    final res = error.response;
    if (res != null) {
      final data = res.data;
      final msg = (data is Map && data['mensaje'] != null)
          ? data['mensaje'].toString()
          : 'Solicitud rechazada.';

      switch (res.statusCode) {
        case 401:
          return ApiError(
            mensaje: 'Credenciales incorrectas.',
            detalle: msg,
            statusCode: 401,
          );
        case 403:
          return ApiError(
            mensaje: 'Acceso denegado.',
            detalle: msg,
            statusCode: 403,
          );
        case 404:
          return ApiError(
            mensaje: 'Recurso no encontrado.',
            statusCode: 404,
          );
        default:
          return ApiError(
            mensaje: 'Error del servidor.',
            detalle: msg,
            statusCode: res.statusCode,
          );
      }
    }

    return ApiError(mensaje: 'Error de red desconocido.');
  }

  // ⚠️ Cualquier otro error
  return ApiError(
    mensaje: 'Ocurrió un error inesperado.',
    detalle: error.toString(),
  );
}
