import 'package:flutter/material.dart';

class Dialogos {
  /// Diálogo de confirmación genérico con protección de context
  static Future<bool?> confirmar({
    required BuildContext context,
    required String titulo,
    required String contenido,
    String textoCancelar = 'Cancelar',
    String textoConfirmar = 'Confirmar',
    Color colorConfirmar = Colors.red,
    IconData? icono,
  }) async {
    // Protección: Si el context ya no es válido, no intentamos abrir el diálogo
    if (!context.mounted) return false;

    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // Obliga a interactuar con los botones
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        icon: icono != null
            ? Icon(icono, size: 40, color: Theme.of(context).colorScheme.primary)
            : null,
        title: Text(
          titulo,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(textoConfirmar,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // MÉTODOS PARA CLIENTES
  // ==========================================

  /// Diálogo específico para editar Clientes
  static Future<bool?> confirmarEditarCliente({
    required BuildContext context,
    required String nombre,
    required bool hayInternet,
  }) {
    return confirmar(
      context: context,
      titulo: 'Editar Cliente',
      contenido: '¿Deseas modificar la información de "$nombre"?\n\n'
          '${!hayInternet ? "⚠️ Estás en modo offline. Los cambios se sincronizarán cuando recuperes la conexión." : "Los cambios se actualizarán en el servidor inmediatamente."}',
      icono: Icons.person,
      textoConfirmar: 'Editar',
      colorConfirmar: Colors.blue.shade700,
    );
  }

  /// Diálogo específico para eliminar Clientes
  static Future<bool?> confirmarEliminarCliente({
    required BuildContext context,
    required String nombre,
    required String ruc,
  }) {
    return confirmar(
      context: context,
      titulo: 'Eliminar Cliente',
      contenido: '¿Estás seguro de eliminar a:\n"$nombre"\nID/RUC: $ruc?\n\nEsta acción no se puede deshacer.',
      icono: Icons.person,
      textoConfirmar: 'Eliminar',
      colorConfirmar: Colors.red.shade700,
    );
  }

  // ==========================================
  // MÉTODOS PARA VEHÍCULOS (Manteniéndolos por compatibilidad)
  // ==========================================

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