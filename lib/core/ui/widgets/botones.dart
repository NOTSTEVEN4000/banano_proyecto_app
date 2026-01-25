import 'package:flutter/material.dart';

/// Botón de acción principal con gradiente y elevación
Widget botonPrincipal({
  required String etiqueta,
  required IconData icono,
  required VoidCallback? alPresionar,
  bool cargando = false,
  Color? colorBasico,
}) {
  return Container(
    width: double.infinity,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: alPresionar == null 
          ? null 
          : LinearGradient(
              colors: colorBasico != null 
                  ? [colorBasico.withOpacity(0.8), colorBasico]
                  : [Colors.indigo.shade400, Colors.indigo.shade700],
            ),
      boxShadow: alPresionar == null ? [] : [
        BoxShadow(
          color: (colorBasico ?? Colors.indigo).withOpacity(0.3),
          blurRadius: 10,
          offset: const Offset(0, 5),
        )
      ],
    ),
    child: ElevatedButton.icon(
      onPressed: cargando ? null : alPresionar,
      icon: cargando 
          ? const SizedBox.shrink() 
          : Icon(icono, color: Colors.white, size: 22),
      label: cargando
          ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
          : Text(
              etiqueta.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        disabledBackgroundColor: Colors.grey.shade300,
      ),
    ),
  );
}

/// Botón de estilo "Outlined" para acciones secundarias (Eliminar)
Widget botonSecundario({
  required String etiqueta,
  required IconData icono,
  required VoidCallback alPresionar,
  required Color color,
}) {
  return OutlinedButton.icon(
    onPressed: alPresionar,
    icon: Icon(icono, size: 20),
    label: Text(etiqueta.toUpperCase()),
    style: OutlinedButton.styleFrom(
      foregroundColor: color,
      minimumSize: const Size.fromHeight(50),
      side: BorderSide(color: color, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
    ),
  );
}