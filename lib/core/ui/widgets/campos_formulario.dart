import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget componenteCampoTexto({
  required TextEditingController controlador,
  required String etiqueta,
  required IconData icono,
  TextInputType? tipoTeclado,
  List<TextInputFormatter>? formateadores,
  String? Function(String?)? funcionValidacion,
  bool habilitado = true,
  String? textoError,
  int? maxLines = 1, // Por defecto 1 para que no sea null
}) {
  return Builder(builder: (context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: controlador,
      keyboardType: tipoTeclado,
      inputFormatters: formateadores,
      validator: funcionValidacion,
      enabled: habilitado,
      maxLines: maxLines,
      // Estilo de texto cuando se escribe
      style: TextStyle(
        color: habilitado ? colorScheme.onSurface : colorScheme.onSurface.withOpacity(0.5),
      ),
      decoration: InputDecoration(
        labelText: etiqueta,
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        prefixIcon: Icon(icono, color: colorScheme.primary),
        errorText: textoError,
        filled: true,
        // Color de fondo dinámico según el tema
        fillColor: isDark ? colorScheme.surfaceContainer : Colors.grey.shade50,
        // Bordes suaves de 16px para formularios
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.2)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  });
}

Widget subtituloSeccion(String titulo) {
  return Builder(builder: (context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 8, left: 4),
      child: Text(
        titulo.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w900, 
          color: colorScheme.primary,
          fontSize: 12,
          letterSpacing: 1.1,
        ),
      ),
    );
  });
}