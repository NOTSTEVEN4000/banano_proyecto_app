import 'package:flutter/material.dart';
import '../../data/models/vehiculo_entity.dart';
import 'package:banano_proyecto_app/core/utils/estado_colores.dart';

class VehiculoCard extends StatefulWidget {
  final VehiculoEntity v;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onReactivar;
  final bool showPendingBadge;
  final bool esAdministrador;

  const VehiculoCard({
    super.key,
    required this.v,
    this.onEdit,
    this.onDelete,
    this.onReactivar,
    this.showPendingBadge = false,
    required this.esAdministrador,
  });

  @override
  State<VehiculoCard> createState() => _VehiculoCardState();
}

class _VehiculoCardState extends State<VehiculoCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Configuración de fondo: Blanco puro en claro, gris suave (surfaceContainer) en oscuro
    final Color cardBg = isDark ? colorScheme.surfaceContainer : Colors.white;

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
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // ... dentro de build ...
                Row(
                  children: [
                    Stack(
                      // Stack para poner el icono de pendiente sobre el avatar
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: colorScheme.primaryContainer,
                          child: Text(
                            widget.v.nombre.isNotEmpty
                                ? widget.v.nombre[0].toUpperCase()
                                : '?',
                            style: TextStyle(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        // ICONO AMARILLO DE PENDIENTE
                        if (widget.showPendingBadge)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors
                                    .amber, // Amarillo para advertencia/pendiente
                                shape: BoxShape.circle,
                                border: Border.all(color: cardBg, width: 2),
                              ),
                              child: const Icon(
                                Icons
                                    .sync_problem_rounded, // Icono de sincronización pendiente
                                size: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // Fila para el nombre y el texto "Pendiente"
                            children: [
                              Flexible(
                                child: Text(
                                  widget.v.nombre,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.onSurface,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (widget.showPendingBadge) ...[
                                const SizedBox(width: 6),
                                Text(
                                  '(Pendiente)',
                                  style: TextStyle(
                                    color: Colors.amber.shade800,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 6),
                          _buildBadge(widget.v.estado, colorScheme, isDark),
                        ],
                      ),
                    ),
                    _buildTrailing(colorScheme),
                  ],
                ),

                // Contenido expandible animado
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: _buildExpandedContent(colorScheme, isDark),
                  crossFadeState: _expanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String? estado, ColorScheme colorScheme, bool isDark) {
    final baseColor = getColorPorEstado(estado);

    // Si es oscuro, aclaramos el texto para que resalte. Si es claro, lo oscurecemos.
    final Color textColor = isDark
        ? _adjustColor(baseColor, 0.3, lighten: true)
        : _adjustColor(baseColor, 0.2, lighten: false);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: baseColor.withOpacity(isDark ? 0.25 : 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: baseColor.withOpacity(0.4)),
      ),
      child: Text(
        estado?.toUpperCase() ?? 'DESCONOCIDO',
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildTrailing(ColorScheme colorScheme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${widget.v.capacidadCajas ?? 0}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: colorScheme.primary,
              ),
            ),
            Text(
              'CAJAS',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: colorScheme.outline,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        AnimatedRotation(
          turns: _expanded ? 0.5 : 0,
          duration: const Duration(milliseconds: 250),
          child: Icon(Icons.expand_more, color: colorScheme.outline),
        ),
      ],
    );
  }

  Widget _buildExpandedContent(ColorScheme colorScheme, bool isDark) {
    // Determinamos si el vehículo está inactivo para mostrar el botón de reactivar
    // Asumiendo que v.activo es el booleano que manejas
    final bool estaInactivo = !widget.v.activo;

    return Column(
      children: [
        const SizedBox(height: 16),
        Divider(color: colorScheme.outlineVariant.withOpacity(0.5)),
        const SizedBox(height: 12),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 42,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            _infoTile(Icons.tag, widget.v.placa, colorScheme, isDark),
            _infoTile(
              Icons.branding_watermark,
              widget.v.marca,
              colorScheme,
              isDark,
            ),
            _infoTile(Icons.local_shipping, widget.v.tipo, colorScheme, isDark),
            _infoTile(
              Icons.speed,
              '${widget.v.kilometrajeActual ?? 0} km',
              colorScheme,
              isDark,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Si está inactivo, mostramos principalmente el botón de Reactivar
            if (estaInactivo)
              FilledButton.icon(
                onPressed: widget.onReactivar,
                icon: const Icon(Icons.settings_backup_restore, size: 18),
                label: const Text('Reactivar Vehículo'),
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
              )
            else ...[
              // Si está activo, mostramos las acciones normales
              TextButton.icon(
                onPressed: widget.onDelete,
                icon: const Icon(Icons.delete_outline, size: 18),
                label: const Text('Eliminar'),
                style: TextButton.styleFrom(foregroundColor: colorScheme.error),
              ),
              const SizedBox(width: 8),
              FilledButton.tonalIcon(
                onPressed: widget.onEdit,
                icon: const Icon(Icons.edit_outlined, size: 18),
                label: const Text('Editar'),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _infoTile(
    IconData icon,
    String text,
    ColorScheme colorScheme,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isDark
            ? colorScheme.surface
            : colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: colorScheme.secondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Función interna para ajustar brillo de colores según el tema
  Color _adjustColor(Color color, double amount, {required bool lighten}) {
    final hsl = HSLColor.fromColor(color);
    final newLightness = lighten
        ? (hsl.lightness + amount).clamp(0.0, 0.95)
        : (hsl.lightness - amount).clamp(0.0, 0.95);
    return hsl.withLightness(newLightness).toColor();
  }
}
