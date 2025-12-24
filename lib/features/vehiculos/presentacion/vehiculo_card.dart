import 'package:flutter/material.dart';
import '../data/models/vehiculo_entity.dart';

class VehiculoCard extends StatelessWidget {
  final VehiculoEntity v;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool showPendingBadge;

  const VehiculoCard({
    super.key,
    required this.v,
    this.onEdit,
    this.onDelete,
    this.showPendingBadge = false,
  });

  // Color según estado
  Color _getEstadoColor(BuildContext context, String? estado) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (estado?.toLowerCase()) {
      case 'operativo':
        return colorScheme.primary;
      case 'en mantenimiento':
      case 'en reparación':
        return Colors.orange;
      case 'fuera de servicio':
      case 'baja temporal':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool tienePendiente = showPendingBadge || v.pendienteSync;
    final bool puedeEditar = onEdit != null;
    final bool puedeEliminar = onDelete != null;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
              bottom: tienePendiente ? 48 : 16, // Espacio para el badge inferior
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar grande con inicial
                CircleAvatar(
                  radius: 32,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Text(
                    v.nombre.isNotEmpty ? v.nombre[0].toUpperCase() : '?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Información principal
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre del vehículo
                      Text(
                        v.nombre,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),

                      // Placa destacada
                      Row(
                        children: [
                          Icon(Icons.confirmation_number, size: 18, color: theme.colorScheme.primary),
                          const SizedBox(width: 6),
                          Text(
                            'Placa: ${v.placa}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Marca, modelo y año
                      if (v.marca.isNotEmpty || v.modelo.isNotEmpty || v.anio != null)
                        Row(
                          children: [
                            Icon(Icons.directions_car, size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                '${v.marca} ${v.modelo}'.trim(),
                                style: theme.textTheme.bodyMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (v.anio != null) ...[
                              const SizedBox(width: 8),
                              Text(
                                '• Año: ${v.anio}',
                                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                              ),
                            ],
                          ],
                        ),

                      // Capacidad
                      if (v.capacidadCajas != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Icon(Icons.inventory_2, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 6),
                              Text(
                                'Capacidad: ${v.capacidadCajas} cajas',
                                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),

                      // Conductor
                      if (v.conductorAsignadoNombre != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Icon(Icons.person, size: 16, color: Colors.grey[600]),
                              const SizedBox(width: 6),
                              Text(
                                'Conductor: ${v.conductorAsignadoNombre}',
                                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),

                      const SizedBox(height: 12),

                      // Chip de estado
                      Chip(
                        label: Text(
                          v.estado ?? 'Sin estado',
                          style: const TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        backgroundColor: _getEstadoColor(context, v.estado),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ],
                  ),
                ),

                // Botones de acción (derecha)
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (puedeEditar)
                      IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        color: theme.colorScheme.primary,
                        tooltip: 'Editar',
                        onPressed: onEdit,
                      ),
                    if (puedeEliminar)
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        color: Colors.red,
                        tooltip: 'Eliminar',
                        onPressed: onDelete,
                      ),
                  ],
                ),
              ],
            ),
          ),

          // Badge "Pendiente" en la esquina INFERIOR DERECHA
          if (tienePendiente)
            Positioned(
              bottom: 8,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.orange.shade600,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.cloud_upload, size: 20, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Sincronización pendiente',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}