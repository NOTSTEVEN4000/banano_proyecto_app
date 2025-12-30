import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityServiceProvider = Provider((ref) => ConnectivityService());

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  // Servidor confiable para probar conexión real (Google DNS)
  static const String _testUrl = '8.8.8.8';
  static const int _testPort = 53;
  static const Duration _timeout = Duration(seconds: 3);

  // Stream que combina connectivity_plus + prueba real de internet
  Stream<bool> get connectionStream async* {
    // Primera emisión inmediata
    yield await _hasRealInternet();

    // Luego escuchamos cambios de connectivity_plus
    await for (final result in _connectivity.onConnectivityChanged) {
      if (result == ConnectivityResult.none) {
        yield false;
      } else {
        yield await _hasRealInternet();
      }
    }
  }

  // Método para comprobar internet real
  Future<bool> _hasRealInternet() async {
    try {
      final socket = await Socket.connect(_testUrl, _testPort, timeout: _timeout);
      socket.destroy();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Método manual para comprobar en cualquier momento
  Future<bool> hasInternet() async {
    return await _hasRealInternet();
  }
}