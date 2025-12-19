import 'package:banano_proyecto_app/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';


class AuthInterceptor extends Interceptor {
  final SecureStore store;
  AuthInterceptor(this.store);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await store.readToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
