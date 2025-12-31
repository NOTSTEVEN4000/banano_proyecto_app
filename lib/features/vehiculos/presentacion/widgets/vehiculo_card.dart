import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:flutter/material.dart';
import '../../data/models/vehiculo_entity.dart';

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

  Color _getCardColor() {
    final tienePendiente = widget.showPendingBadge || widget.v.pendienteSync;
    final esInactivo = !widget.v.activo;

    if (esInactivo) {
      return const Color.fromARGB(255, 250, 219, 222);
    } else if (tienePendiente) {
      return Colors.orange.shade50;
    } else {
      return Colors.green.shade50;
    }
  }

  Color _getAvatarColor() {
    final tienePendiente = widget.showPendingBadge || widget.v.pendienteSync;
    final esInactivo = !widget.v.activo;

    if (esInactivo) {
      return Colors.red.shade700;
    } else if (tienePendiente && esInactivo) {
      return Colors.orange.shade600;
    } else {
      return Colors.green.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    final v = widget.v;
    final tienePendiente = widget.showPendingBadge || v.pendienteSync;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => setState(() => _expanded = !_expanded),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: _getCardColor(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === CABECERA ===
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: _getAvatarColor(),
                    child: Text(
                      v.nombre.isNotEmpty ? v.nombre[0].toUpperCase() : '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NOMBRE
                        Text(
                          v.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),

                        // ESTADO + PLACA (en la misma columna, uno debajo del otro)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ESTADO (badge)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: getColorPorEstado(v.estado),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                v.estado ?? 'Sin estado',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(height: 6),

                            // PLACA (debajo del estado)
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Placa ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: v.placa,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // CAPACIDAD / PRECIO DERECHA
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (v.capacidadCajas != null)
                        Text(
                          '${v.capacidadCajas} cajas',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      const SizedBox(height: 4),
                      if (tienePendiente)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade600,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.cloud_upload,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Pendiente',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(width: 8),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),

              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: _expanded
                    ? Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 8),
                        child: Column(
                          children: [
                            const Divider(height: 1),

                            // Fila 1: Marca + Modelo
                            _filaCompacta(
                              _chipInfo(Icons.directions_car_filled, v.marca),
                              _chipInfo(Icons.directions_car, v.modelo),
                            ),

                            // Fila 2: Tipo + Año (si existe)
                            _filaCompacta(
                              _chipInfo(Icons.view_module, v.tipo),
                              v.anio != null
                                  ? _chipInfo(
                                      Icons.calendar_today,
                                      v.anio.toString(),
                                    )
                                  : const SizedBox.shrink(),
                            ),

                            // Fila 3: Color + Kilometraje (si existen)
                            _filaCompacta(
                              v.color != null
                                  ? _chipInfo(Icons.color_lens, v.color!)
                                  : const SizedBox.shrink(),
                              v.kilometrajeActual != null
                                  ? _chipInfo(
                                      Icons.speed,
                                      '${v.kilometrajeActual} km',
                                    )
                                  : const SizedBox.shrink(),
                            ),

                            // Fila 4: Capacidad + Conductor (si existen)
                            if (v.capacidadCajas != null ||
                                v.conductorAsignadoNombre != null)
                              _filaCompacta(
                                v.capacidadCajas != null
                                    ? _chipInfo(
                                        Icons.inventory_2,
                                        '${v.capacidadCajas} cajas',
                                      )
                                    : const SizedBox.shrink(),
                                v.conductorAsignadoNombre != null
                                    ? _chipInfo(
                                        Icons.person,
                                        v.conductorAsignadoNombre!,
                                      )
                                    : const SizedBox.shrink(),
                              ),

                            const SizedBox(height: 12),

                            // Botones compactos al final
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (!v.activo && widget.esAdministrador)
                                  _miniBoton(
                                    Icons.restore,
                                    'Reactivar',
                                    Colors.green.shade600,
                                    widget.onReactivar,
                                  )
                                else ...[
                                  _miniBoton(
                                    Icons.edit,
                                    'Editar',
                                    Colors.indigo.shade600,
                                    widget.onEdit,
                                  ),
                                  const SizedBox(width: 8),
                                  _miniBoton(
                                    Icons.delete,
                                    'Eliminar',
                                    Colors.red.shade600,
                                    widget.onDelete,
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filaCompacta(Widget izquierda, Widget derecha) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: izquierda),
          const SizedBox(width: 10),
          Expanded(child: derecha),
        ],
      ),
    );
  }

  Widget _chipInfo(IconData icon, String texto) {
    if (texto.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.indigo.shade600),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              texto,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniBoton(
    IconData icon,
    String texto,
    Color color,
    VoidCallback? onPressed,
  ) {
    return SizedBox(
      height: 36,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 16, color: color),
        label: Text(
          texto,
          style: TextStyle(
            fontSize: 15,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
