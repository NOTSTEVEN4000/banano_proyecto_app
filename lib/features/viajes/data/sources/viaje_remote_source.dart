import 'package:dio/dio.dart';

class ViajesRemoteSource {
  final Dio dio;

  ViajesRemoteSource(this.dio);

  // ── VIAJE PRINCIPAL ───────────────────────────────────────────────────



  Future<Map<String, dynamic>> crear(Map<String, dynamic> data) async {
    final response = await dio.post('/viajes', data: data);
    return response.data;
  }

  // En ViajesRemoteSource
// viajes_remote_source.dart

Future<List<Map<String, dynamic>>> listarTodoHistorial() async {
  final response = await dio.get('/viajes/historial');
  final List<dynamic> datos = response.data['data']; 
  return datos.map((e) => e as Map<String, dynamic>).toList();
}


  Future<List<Map<String, dynamic>>> listarPorFecha(String fecha) async {
    try {
      final response = await dio.get(
        '/viajes',
        queryParameters: {'fecha': fecha},
      );

      final data = response.data;
      List<dynamic> listaViajes;
      if (data is Map<String, dynamic>) {
        if (data['data'] is List) {
          listaViajes = data['data'] as List<dynamic>;
          print('Formato backend: {ok: true, data: [...]} → usado data');
        } else if (data['viajes'] is List) {
          listaViajes =
              data['viajes'] as List<dynamic>; // por si usas 'viajes' como key
        } else {
          throw Exception(
            'Formato inesperado en respuesta: no hay lista de viajes',
          );
        }
      } else if (data is List) {
        listaViajes = data;
        print('Formato backend: lista directa [...]');
      } else {
        throw Exception('Respuesta no válida: $data');
      }

      return listaViajes.cast<Map<String, dynamic>>();
    } catch (e, stack) {
      print('Error al listar viajes remoto: $e');
      print('Stack: $stack');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> iniciar(String idExterno) async {
    final response = await dio.patch('/viajes/$idExterno/iniciar');
    return response.data;
  }

  Future<Map<String, dynamic>> entregar(
    String idExterno,
    Map<String, dynamic> data,
  ) async {
    final response = await dio.patch('/viajes/$idExterno/entregar', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> resumen(String fecha) async {
    final response = await dio.get(
      '/viajes/resumen',
      queryParameters: {'fecha': fecha},
    );
    return response.data;
  }

  // ── REGISTROS ASOCIADOS ───────────────────────────────────────────────

  Future<void> registrarInsumos(
    String idExterno,
    Map<String, dynamic> data,
  ) async {
    await dio.post('/viajes/$idExterno/insumos', data: data);
  }

  // Actualizar (PUT) - siempre envía la lista completa
  Future<void> actualizarInsumos(
    String idExterno,
    Map<String, dynamic> data,
  ) async {
    await dio.put('/viajes/$idExterno/insumos', data: data);
  }

  // Eliminar todo (DELETE)
  Future<void> eliminarInsumos(String idExterno) async {
    await dio.delete('/viajes/$idExterno/insumos');
  }

  Future<void> agregarCargaCajas(
    String idExterno,
    Map<String, dynamic> data,
  ) async {
    await dio.post('/viajes/$idExterno/cargas-cajas', data: data);
  }

  Future<void> agregarCombustible(
    String idExterno,
    Map<String, dynamic> data,
  ) async {
    await dio.post('/viajes/$idExterno/combustible', data: data);
  }

  Future<Map<String, dynamic>?> getInsumos(String idExterno) async {
    try {
      final response = await dio.get('/viajes/$idExterno/insumos');
      final data = response.data as Map<String, dynamic>;

      // Extrae el objeto real de insumos (el campo "data")
      if (data['ok'] == true && data['data'] is Map<String, dynamic>) {
        return data['data'] as Map<String, dynamic>;
      } else {
        print('Formato inesperado en insumos: $data');
        return null;
      }
    } catch (e) {
      print('Error GET insumos: $e');
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getCombustible(String idExterno) async {
    try {
      final response = await dio.get('/viajes/$idExterno/combustible');
      final data = response.data;

      if (data is List) {
        return data.cast<Map<String, dynamic>>();
      } else if (data is Map<String, dynamic>) {
        // Posibles claves comunes: 'data', 'combustible', 'registros', etc.
        if (data['data'] is List)
          return (data['data'] as List).cast<Map<String, dynamic>>();
        if (data['combustible'] is List)
          return (data['combustible'] as List).cast<Map<String, dynamic>>();
        if (data['registros'] is List)
          return (data['registros'] as List).cast<Map<String, dynamic>>();
        print('Formato inesperado en combustible: $data');
        return [];
      } else {
        print('Respuesta no válida en combustible: $data');
        return [];
      }
    } catch (e) {
      print('Error GET combustible: $e');
      return [];
    }
  }
}
