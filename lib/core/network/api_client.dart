import 'package:banano_proyecto_app/core/network/interceptors/auth_interceptor.dart';
import 'package:banano_proyecto_app/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';
import '../config/env.dart';

class ApiClient {
  late final Dio dio;

  ApiClient(SecureStore store) {
    dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
        validateStatus: (status) =>
            status != null && status < 500, // ✅ NO lanza con 4xx
      ),
    );

    dio.interceptors.add(AuthInterceptor(store));
  }
}
