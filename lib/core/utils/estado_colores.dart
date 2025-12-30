import 'package:flutter/material.dart';

/// Devuelve el color correspondiente al estado de cualquier entidad
/// Usa nombres normalizados en minúsculas para evitar errores
Color getColorPorEstado(String? estado) {
  final estadoLower = estado?.toLowerCase().trim();

  return switch (estadoLower) {
    'activo' || 'operativo' => Colors.green.shade700,
    'inactivo' || 'fuera de servicio' => Colors.red.shade700,
    'en mantenimiento' || 'suspendido' => Colors.orange.shade700,
    'pendiente' || 'pendiente sync' => Colors.amber.shade700,
    _ => Colors.grey.shade700,
  };
}