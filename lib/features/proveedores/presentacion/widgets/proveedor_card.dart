import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:banano_proyecto_app/features/proveedores/presentacion/pages/detalle_proveedor_page.dart';
import 'package:flutter/material.dart';

class ProveedorCard extends StatelessWidget {
  final ProveedorEntity proveedor;
  final bool showPendingBadge; // Nueva propiedad para la lógica de sincronización

  const ProveedorCard({
    super.key, 
    required this.proveedor, 
    this.showPendingBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? colorScheme.surfaceContainer : Colors.white;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark
              ? colorScheme.outlineVariant.withOpacity(0.2)
              : colorScheme.outlineVariant.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetalleProveedorPage(proveedor: proveedor),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Avatar con Badge de Sincronización
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: _getAvatarColor(),
                      child: Text(
                        proveedor.nombre.isNotEmpty
                            ? proveedor.nombre[0].toUpperCase()
                            : '?',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    if (showPendingBadge)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                            border: Border.all(color: cardBg, width: 2),
                          ),
                          child: const Icon(
                            Icons.sync_problem_rounded,
                            size: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                // Información Central
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              proveedor.nombre,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (showPendingBadge) ...[
                            const SizedBox(width: 4),
                            Icon(Icons.cloud_off_rounded, size: 14, color: Colors.amber.shade800),
                          ],
                        ],
                      ),
                      const SizedBox(height: 6),
                      _buildBadge(proveedor.estado, colorScheme, isDark),
                      if (proveedor.rucCi != null && proveedor.rucCi!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          'ID: ${proveedor.rucCi}',
                          style: TextStyle(
                            color: colorScheme.outline,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Parte Económica
                SizedBox(
                  width: 105, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        proveedor.precioFormateado,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      if (proveedor.saldoPorPagar > 0)
                        Text(
                          proveedor.saldoFormateado,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      const SizedBox(height: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: colorScheme.onSurfaceVariant.withOpacity(0.6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String estado, ColorScheme colorScheme, bool isDark) {
    final baseColor = getColorPorEstado(estado);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: baseColor.withOpacity(isDark ? 0.25 : 0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: baseColor.withOpacity(0.4)),
      ),
      child: Text(
        estado.toUpperCase(),
        style: TextStyle(
          color: isDark ? _lighten(baseColor, 0.2) : _darken(baseColor, 0.1),
          fontSize: 10,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Color _getAvatarColor() {
    if (!proveedor.activo) return Colors.red.shade700;
    // Si está pendiente de sincronizar, usamos un color ámbar para el avatar también
    if (showPendingBadge) return Colors.orange.shade700;
    return Colors.green.shade600;
  }

  Color _lighten(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
  }

  Color _darken(Color color, [double amount = .1]) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0)).toColor();
  }
}