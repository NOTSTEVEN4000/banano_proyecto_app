import 'package:dio/dio.dart';

class ClientesRemoteSource {
  final Dio dio;
  ClientesRemoteSource(this.dio);

  Future<List<Map<String, dynamic>>> listarActivos() async {
    final res = await dio.get('/clientes');
    final raw = res.data;
    final list = (raw is List) ? raw : (raw['data'] as List);
    return list.cast<Map<String, dynamic>>();
  }

    // Listado completo solo para admin
  Future<List<Map<String, dynamic>>> listarTodos() async {
    final res = await dio.get('/clientes/todos'); // ← Solo admin
    final raw = res.data;
    final list = (raw is List) ? raw : (raw['data'] as List);
    return list.cast<Map<String, dynamic>>();
  }

  Future<void> crear(Map<String, dynamic> data) async {
    await dio.post('/clientes', data: data);
  }

  Future<void> editar(String idExterno, Map<String, dynamic> data) async {
    await dio.patch('/clientes/$idExterno', data: data);
  }

  Future<void> eliminar(String idExterno) async {
    await dio.delete('/clientes/$idExterno');
  }

  Future<void> reactivar(String idExterno) async {
    try {
      await dio.patch('/clientes/$idExterno/reactivar');
    } on DioException catch (e) {
      // Manejo de errores personalizado si quieres
      if (e.response?.statusCode == 404) {
        throw Exception('Cliente no encontrado o ya activo');
      }
      rethrow;
    }
  }
}