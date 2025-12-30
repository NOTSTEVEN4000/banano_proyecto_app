// lib/core/utilidades/formateadores.dart
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class Formateadores {
  static TextInputFormatter placaEcuatoriana() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      // Remover todo excepto letras y números
      String texto = newValue.text.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');

      // Limitar longitud máxima
      if (texto.length > 7) {
        texto = texto.substring(0, 7);
      }

      String formateado = '';

      // Aplicar formato solo si hay al menos 4 caracteres (para poner el guion)
      if (texto.length > 3) {
        final letras = texto.substring(0, 3);
        final numeros = texto.substring(3);
        formateado = '$letras-$numeros';
      } else {
        formateado = texto;
      }

      // Calcular nueva posición del cursor
      int nuevaPosicion = formateado.length;

      // Si el usuario estaba escribiendo al final, mantener el cursor al final
      if (oldValue.selection.baseOffset == oldValue.text.length) {
        nuevaPosicion = formateado.length;
      }

      return TextEditingValue(
        text: formateado,
        selection: TextSelection.collapsed(offset: nuevaPosicion),
      );
    });
  }

  static String formatearFecha(DateTime fecha) {
    final local = fecha.toLocal();
    return DateFormat('dd/MM/yyyy HH:mm').format(local);
  }

  static String formatearPrecio(double precio, String moneda) {
    return '${NumberFormat.currency(locale: 'es_EC', symbol: moneda, decimalDigits: 2).format(precio)}';
  }
}

