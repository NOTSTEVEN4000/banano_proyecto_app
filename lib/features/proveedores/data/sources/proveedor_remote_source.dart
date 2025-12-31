// lib/features/proveedores/data/sources/proveedor_remote_source.dart

import 'package:dio/dio.dart';

class ProveedorRemoteSource {
  final Dio dio;

  ProveedorRemoteSource(this.dio);

  /// Lista proveedores activos (ruta normal)
  Future<List<Map<String, dynamic>>> listarActivos() async {
    final res = await dio.get('/proveedores');
    final raw = res.data;
    final list = (raw is List) ? raw : (raw['data'] as List);
    return list.cast<Map<String, dynamic>>();
  }

  /// Listado completo incluyendo inactivos (solo para administrador)
  Future<List<Map<String, dynamic>>> listarTodos() async {
    final res = await dio.get('/proveedores/todos');
    final raw = res.data;
    final list = (raw is List) ? raw : (raw['data'] as List);
    return list.cast<Map<String, dynamic>>();
  }

  /// Crea un nuevo proveedor
  Future<void> crear(Map<String, dynamic> data) async {
    await dio.post('/proveedores', data: data);
  }

  /// Edita un proveedor existente
  Future<void> editar(String idExterno, Map<String, dynamic> data) async {
    await dio.patch('/proveedores/$idExterno', data: data);
  }

  /// Elimina lógicamente un proveedor
  Future<void> eliminar(String idExterno) async {
    await dio.delete('/proveedores/$idExterno');
  }

  /// Reactiva un proveedor eliminado
  Future<void> reactivar(String idExterno) async {
    try {
      await dio.patch('/proveedores/$idExterno/reactivar');
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Proveedor no encontrado o ya activo');
      }
      rethrow;
    }
  }
}