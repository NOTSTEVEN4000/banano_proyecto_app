import 'package:flutter/material.dart';

class Dialogos {
  /// Diálogo de confirmación genérico
  static Future<bool?> confirmar({
    required BuildContext context,
    required String titulo,
    required String contenido,
    String textoCancelar = 'Cancelar',
    String textoConfirmar = 'Confirmar',
    Color colorConfirmar = Colors.red,
    IconData? icono,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        icon: icono != null
            ? Icon(icono, size: 40, color: Theme.of(context).colorScheme.primary)
            : null,
        title: Text(
          titulo,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        content: Text(
          contenido,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(textoCancelar, style: const TextStyle(fontSize: 16)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorConfirmar,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(textoConfirmar, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  /// Diálogo específico para editar (con info de internet)
  static Future<bool?> confirmarEditar({
    required BuildContext context,
    required String nombre,
    required String placa,
    required bool hayInternet,
  }) {
    return confirmar(
      context: context,
      titulo: 'Editar vehículo',
      contenido: '¿Estás seguro de editar "$nombre" ($placa)?\n\n'
          '${!hayInternet ? "Se guardará localmente y se sincronizará después." : "Los cambios se guardarán inmediatamente."}',
      icono: Icons.edit_outlined,
      textoConfirmar: 'Editar',
      colorConfirmar: Colors.blue.shade600,
    );
  }

  /// Diálogo específico para eliminar
  static Future<bool?> confirmarEliminar({
    required BuildContext context,
    required String nombre,
    required String placa,
  }) {
    return confirmar(
      context: context,
      titulo: 'Eliminar vehículo',
      contenido: '¿Estás seguro de eliminar "$nombre" ($placa)?\n\nEsta acción no se puede deshacer.',
      icono: Icons.delete_forever_outlined,
      textoConfirmar: 'Eliminar',
      colorConfirmar: Colors.red.shade600,
    );
  }
}