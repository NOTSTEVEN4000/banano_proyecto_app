import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:banano_proyecto_app/features/proveedores/presentacion/pages/detalle_proveedor_page.dart';
import 'package:flutter/material.dart';

class ProveedorCard extends StatelessWidget {
  final ProveedorEntity proveedor;
  final bool showPendingBadge;

  const ProveedorCard({
    super.key,
    required this.proveedor,
    this.showPendingBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final tienePendiente = showPendingBadge;

    // 1. Configuración de colores de marco y fondo (Igual a Clientes)
    final cardBg = isDark ? colorScheme.surfaceContainer : Colors.white;
    final borderColor = tienePendiente
        ? Colors.orange.withOpacity(0.8)
        : (isDark
              ? colorScheme.outlineVariant.withOpacity(0.2)
              : Colors.grey.withOpacity(0.4)); // Marco visible en modo claro

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: 1.2, // Ancho definido
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black54 : Colors.black.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetalleProveedorPage(proveedor: proveedor),
            ),
          ),
          child: Stack(
            children: [
              // Franja lateral para pendientes
              if (tienePendiente)
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(width: 5, color: Colors.orange),
                ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
                child: Row(
                  children: [
                    _buildAvatar(tienePendiente, cardBg, colorScheme),

                    const SizedBox(width: 14),

                    // Información Central
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            proveedor.nombre,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              _buildBadge(
                                proveedor.estado,
                                colorScheme,
                                isDark,
                              ),
                              const SizedBox(width: 8),
                              if (proveedor.rucCi != null &&
                                  proveedor.rucCi!.isNotEmpty)
                                Text(
                                  proveedor.rucCi!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Lado Derecho: Económico y Flecha Reforzada
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              proveedor.precioFormateado,
                              style: TextStyle(
                                color: isDark
                                    ? Colors.greenAccent
                                    : Colors.green.shade700,
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                            if (proveedor.saldoPorPagar > 0)
                              Text(
                                proveedor.saldoFormateado,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            if (tienePendiente)
                              const Text(
                                'SIN SYNC',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: colorScheme.primary.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(
    bool tienePendiente,
    Color cardBg,
    ColorScheme colorScheme,
  ) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: !proveedor.activo
                ? Colors.red.shade50
                : (tienePendiente
                      ? Colors.orange.shade50
                      : colorScheme.primaryContainer.withOpacity(0.4)),
            child: Text(
              proveedor.nombre.isNotEmpty
                  ? proveedor.nombre[0].toUpperCase()
                  : '?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: !proveedor.activo
                    ? Colors.red.shade700
                    : (tienePendiente
                          ? Colors.orange.shade800
                          : colorScheme.primary),
              ),
            ),
          ),
        ),
        if (tienePendiente)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                border: Border.all(color: cardBg, width: 2),
              ),
              child: const Icon(
                Icons.sync_problem_rounded,
                size: 10,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBadge(String estado, ColorScheme colorScheme, bool isDark) {
    final baseColor = getColorPorEstado(estado);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: baseColor.withOpacity(isDark ? 0.2 : 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: baseColor.withOpacity(0.3), width: 0.5),
      ),
      child: Text(
        estado.toUpperCase(),
        style: TextStyle(
          color: baseColor,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
