import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banano_proyecto_app/di/providers.dart';

class ViajeCard extends ConsumerWidget {
  final String titulo;
  final String vehiculoId;
  final String estado;
  final VoidCallback onTap;

  const ViajeCard({
    super.key,
    required this.titulo,
    required this.vehiculoId,
    required this.estado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiculosAsync = ref.watch(vehiculosControllerProvider);

    final nombreVehiculo = vehiculosAsync.maybeWhen(
      data: (listado) {
        final v = listado.firstWhere((e) => e.idExterno == vehiculoId);
        return v?.nombre ?? v?.placa ?? 'Vehículo Desconocido';
      },
      orElse: () => 'Cargando...',
    );

    // Configuración de colores según el estado
    final colorEsquema = _getColorsForEstado(estado, context);

    return Card(
      elevation: 0, // Material 3 usa tonalidad más que sombras
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      // Usamos el color de superficie tonal de M3
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Badge de Categoría / Icono
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorEsquema.container,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _getIconForEstado(estado),
                      size: 20,
                      color: colorEsquema.onContainer,
                    ),
                  ),
                  // Chip de Estado estilizado
                  _buildEstadoChip(context, colorEsquema),
                ],
              ),
              const SizedBox(height: 16),
              // Título (Eliminamos el "Viaje:" repetitivo)
              Text(
                titulo.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              const SizedBox(height: 4),
              // Información del Vehículo
              Row(
                children: [
                  Icon(
                    Icons.local_shipping_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    nombreVehiculo,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEstadoChip(BuildContext context, _EstadoColor esquema) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: esquema.container,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: esquema.onContainer.withOpacity(0.2)),
      ),
      child: Text(
        estado,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: esquema.onContainer,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  // --- Lógica Visual de Material 3 ---

  _EstadoColor _getColorsForEstado(String estado, BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    switch (estado.toUpperCase()) {
      case 'EN_RUTA':
        return _EstadoColor(Colors.orange.shade100, Colors.orange.shade900);
      case 'ENTREGADO':
        return _EstadoColor(Colors.green.shade100, Colors.green.shade900);
      case 'CREADO':
        return _EstadoColor(colors.primaryContainer, colors.onPrimaryContainer);
      default:
        return _EstadoColor(colors.surfaceVariant, colors.onSurfaceVariant);
    }
  }

  IconData _getIconForEstado(String estado) {
    switch (estado.toUpperCase()) {
      case 'EN_RUTA': return Icons.directions_bus_filled_outlined;
      case 'ENTREGADO': return Icons.task_alt;
      default: return Icons.inventory_2_outlined;
    }
  }
}

// Clase auxiliar para manejar los pares de colores
class _EstadoColor {
  final Color container;
  final Color onContainer;
  _EstadoColor(this.container, this.onContainer);
}