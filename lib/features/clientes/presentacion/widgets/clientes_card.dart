import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:banano_proyecto_app/core/utils/formateadores.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/clientes/presentacion/pages/detalle_cliente_page.dart';
import 'package:flutter/material.dart';

class ClienteCard extends StatelessWidget {
  final ClienteEntity cliente;
  final bool showPendingBadge;
  final bool esAdministrador;

  const ClienteCard({
    super.key,
    required this.cliente,
    this.showPendingBadge = false,
    required this.esAdministrador,
  });

  @override
  Widget build(BuildContext context) {
    final tienePendiente = showPendingBadge || cliente.pendienteSync;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Colores optimizados para modo claro
    final cardBg = isDark ? colorScheme.surfaceContainer : Colors.white;
    final shadowColor = isDark ? Colors.black54 : Colors.grey.withOpacity(0.15);
    final borderColor = tienePendiente 
      ? Colors.orange.withOpacity(0.8) 
      : (isDark 
          ? colorScheme.outlineVariant.withOpacity(0.2) 
          : Colors.grey.withOpacity(0.4)); // Subimos de 0.2 a 0.4 para nitidez

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20), // Un poco más pulido
        border: Border.all(
          color: borderColor,
          width: 1.8, // Marco más fino y elegante
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(0, 8), // Sombra hacia abajo para dar profundidad
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetalleClientePage(clienteInicial: cliente)),
          ),
          child: Stack(
            children: [
              if (tienePendiente)
                Positioned(
                  left: 0, top: 0, bottom: 0,
                  child: Container(width: 4, color: Colors.orange), // Franja más delgada
                ),
              
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    _buildAvatar(tienePendiente, cardBg, colorScheme),
                    
                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cliente.nombre,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800, // Un poco más de peso
                              color: colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              _buildEstadoTag(isDark),
                              const SizedBox(width: 8),
                              if (cliente.rucCi != null)
                                Text(
                                  cliente.rucCi!,
                                  style: TextStyle(
                                    fontSize: 12, 
                                    color: colorScheme.onSurfaceVariant.withOpacity(0.7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Lado Derecho: Precio y Flecha más visible
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              Formateadores.formatearPrecio(cliente.precioActual, cliente.moneda),
                              style: TextStyle(
                                color: isDark ? Colors.greenAccent : Colors.green.shade700,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            if (tienePendiente)
                              Text(
                                'PENDIENTE',
                                style: TextStyle(
                                  color: Colors.orange.shade900,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        // Flecha derecha reforzada
                        Icon(
                          Icons.arrow_forward_ios_rounded, 
                          size: 18, 
                          color: colorScheme.primary.withOpacity(0.6), // Color de la marca
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

  Widget _buildAvatar(bool tienePendiente, Color cardBg, ColorScheme colorScheme) {
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
              )
            ],
          ),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: !cliente.activo 
                ? Colors.red.shade50 
                : (tienePendiente ? Colors.orange.shade50 : colorScheme.primaryContainer.withOpacity(0.4)),
            child: Text(
              cliente.nombre.isNotEmpty ? cliente.nombre[0].toUpperCase() : '?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: !cliente.activo 
                    ? Colors.red.shade700 
                    : (tienePendiente ? Colors.orange.shade800 : colorScheme.primary),
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
              child: const Icon(Icons.sync_problem_rounded, size: 10, color: Colors.white),
            ),
          ),
      ],
    );
  }

  Widget _buildEstadoTag(bool isDark) {
    final baseColor = getColorPorEstado(cliente.estado);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: baseColor.withOpacity(isDark ? 0.2 : 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: baseColor.withOpacity(0.3), width: 0.5),
      ),
      child: Text(
        cliente.estado.toUpperCase(),
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