import 'package:dio/dio.dart';

class VehiculosRemoteSource {
  final Dio dio;
  VehiculosRemoteSource(this.dio);

  Future<List<Map<String, dynamic>>> listar({bool incluirInactivos = false}) async {
    final res = await dio.get('/vehiculos', queryParameters: {
      "incluirInactivos": incluirInactivos,
    });

    final raw = res.data;

    // Soporta: lista directa o {data: [...]}
    final list = (raw is List) ? raw : (raw['data'] as List);
    return list.cast<Map<String, dynamic>>();
  }

  Future<void> crear({
    required String idExterno,
    required String placa,
    required String nombre,
    int? capacidadCajas,
    required String tipo,
    required String marca,
    required String modelo,
    int? anio,
    String? color,
    int? kilometrajeActual,
    String? estado,
    String? conductorAsignado,
    String? conductorAsignadoNombre,
  }) async {
    await dio.post('/vehiculos', data: {
      "idExterno": idExterno,
      "placa": placa,
      "nombre": nombre,
      "capacidadCajas": capacidadCajas,
      "tipo": tipo,
      "marca": marca,
      "modelo": modelo,
      if (anio != null) "anio": anio,
      if (color != null) "color": color,
      if (kilometrajeActual != null) "kilometrajeActual": kilometrajeActual,
      if (estado != null) "estado": estado,
      if (conductorAsignado != null) "conductorAsignado": conductorAsignado,
      if (conductorAsignadoNombre != null) "conductorAsignadoNombre": conductorAsignadoNombre,
    });
  }

  /// ✅ IMPORTANTE:
  /// - usar PATCH (tu controller tiene @Patch)
  /// - NO enviar idExterno en el body
  Future<void> editar(String idExterno, Map<String, dynamic> patch) async {
    final cleanPatch = Map<String, dynamic>.from(patch);
    cleanPatch.remove('idExterno');
    cleanPatch.remove('_id');
    cleanPatch.remove('empresaId');
    cleanPatch.remove('activo');
    cleanPatch.remove('creadoPor');
    cleanPatch.remove('actualizadoPor');
    cleanPatch.remove('fechaCreacion');
    cleanPatch.remove('fechaActualizacion');
    cleanPatch.remove('__v');

    await dio.patch('/vehiculos/$idExterno', data: cleanPatch);
  }

  Future<void> eliminar(String idExterno) async {
    await dio.delete('/vehiculos/$idExterno');
  }
}
