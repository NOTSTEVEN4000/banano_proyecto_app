// connectivity_service.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Creamos un provider global para el servicio
final connectivityServiceProvider = Provider((ref) => ConnectivityService());

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  // Este stream emite true/false cada vez que cambia la conexión
  Stream<bool> get connectionStream => _connectivity.onConnectivityChanged.map(
        // ignore: unrelated_type_equality_checks
        (result) => result != ConnectivityResult.none,
      );

  // Método para comprobar en un momento dado
  Future<bool> hasInternet() async {
    final result = await _connectivity.checkConnectivity();
    // ignore: unrelated_type_equality_checks
    return result != ConnectivityResult.none;
  }
}