import 'package:flutter/material.dart';

class MensajesGlobales {
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  /// Muestra un SnackBar moderno y bonito desde cualquier lugar de la app
  static void mostrar({
    required String mensaje,
    required Color colorFondo,
    IconData? icono,
    Duration duracion = const Duration(seconds: 3),
  }) {
    // Oculta cualquier SnackBar anterior
    messengerKey.currentState?.clearSnackBars();

    messengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icono != null) ...[
              Icon(icono, color: Colors.white, size: 24),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                mensaje,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: colorFondo,
        duration: duracion,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(16),
        elevation: 8,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }

  // Métodos rápidos para tipos comunes
  static void exito(String mensaje) {
    mostrar(
      mensaje: mensaje,
      colorFondo: Colors.green.shade600,
      icono: Icons.check_circle,
    );
  }

  static void advertencia(String mensaje) {
    mostrar(
      mensaje: mensaje,
      colorFondo: Colors.orange.shade600,
      icono: Icons.cloud_upload,
    );
  }

  static void advertenciaCampos(String mensaje) {
    mostrar(
      mensaje: mensaje,
      colorFondo: Colors.orange.shade600,
      icono: Icons.warning,
    );
  }

  static void error(String mensaje) {
    mostrar(
      mensaje: mensaje,
      colorFondo: Colors.red.shade600,
      icono: Icons.error,
    );
  }

  static void info(String mensaje) {
    mostrar(
      mensaje: mensaje,
      colorFondo: Colors.blue.shade600,
      icono: Icons.info,
    );
  }
}
