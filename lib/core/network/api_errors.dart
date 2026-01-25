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

    // 📩 Respuesta del backend (Aquí es donde NestJS manda los mensajes)
    final res = error.response;
    if (res != null) {
      final data = res.data;
      
      // Intentamos sacar el mensaje exacto del JSON: { "mensaje": "..." }
      // Si NestJS manda un array (validación de DTO), tomamos el primero.
      String msg = 'Solicitud rechazada.';
      if (data is Map) {
        if (data['mensaje'] is List) {
          msg = data['mensaje'][0].toString();
        } else if (data['mensaje'] != null) {
          msg = data['mensaje'].toString();
        } else if (data['message'] != null) { // Por si NestJS usa la llave por defecto
          msg = data['message'].toString();
        }
      }

      switch (res.statusCode) {
        case 400: // ✅ ESTE ES EL QUE NECESITAS PARA EL CÓDIGO INCORRECTO
          return ApiError(
            mensaje: msg, // Mostrará: "Código incorrecto", "Código expirado", etc.
            statusCode: 400,
          );
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
            detalle: msg,
            statusCode: 404,
          );
        case 500:
          return ApiError(
            mensaje: 'Error interno del servidor.',
            detalle: 'Inténtelo más tarde.',
            statusCode: 500,
          );
        default:
          return ApiError(
            mensaje: 'Error inesperado.',
            detalle: msg,
            statusCode: res.statusCode,
          );
      }
    }

    return ApiError(mensaje: 'Error de red desconocido.');
  }

  // ⚠️ Cualquier otro error (errores de código, nulls, etc)
  return ApiError(
    mensaje: 'Ocurrió un error inesperado.',
    detalle: error.toString(),
  );
}