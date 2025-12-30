import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:banano_proyecto_app/core/utils/formateadores.dart';
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
    if (!widget.v.activo) return const Color.fromARGB(255, 250, 219, 222);
    if (widget.v.pendienteSync) return Colors.orange.shade50;
    return const Color.fromARGB(255, 231, 245, 244);
  }

  Color _getAvatarColor() {
    if (!widget.v.activo) return Colors.red.shade700;
    if (widget.v.pendienteSync) return Colors.orange.shade700;
    return Colors.green.shade600;
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

                        const SizedBox(height: 8),

                        // PLACA
                        Row(
                          children: [
                            Icon(
                              Icons.confirmation_number,
                              size: 18,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Placa: ',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              v.placa,
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 15,
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

              // === CONTENIDO EXPANDIDO ===
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: _expanded
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            const SizedBox(height: 12),

                            // Información técnica
                            const Text(
                              'Datos del vehículo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _detalleRegistros(
                              Icons.directions_car_filled,
                              'Marca',
                              v.marca,
                            ),
                            _detalleRegistros(
                              Icons.directions_car,
                              'Modelo',
                              v.modelo,
                            ),
                            if (v.anio != null)
                              _detalleRegistros(
                                Icons.calendar_today,
                                'Año',
                                v.anio.toString(),
                              ),
                            if (v.color != null)
                              _detalleRegistros(
                                Icons.color_lens,
                                'Color',
                                v.color!,
                              ),
                            if (v.kilometrajeActual != null)
                              _detalleRegistros(
                                Icons.speed,
                                'Kilometraje',
                                '${v.kilometrajeActual} km',
                              ),

                            const SizedBox(height: 16),

                            // Capacidad y conductor
                            const Text(
                              'Operación',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (v.capacidadCajas != null)
                              _detalleRegistros(
                                Icons.inventory_2,
                                'Capacidad',
                                '${v.capacidadCajas} cajas',
                              ),
                            if (v.conductorAsignadoNombre != null)
                              _detalleRegistros(
                                Icons.person,
                                'Conductor',
                                v.conductorAsignadoNombre!,
                              ),

                            const SizedBox(height: 16),

                            // Fechas
                            Text(
                              'Creado: ${Formateadores.formatearFecha(v.fechaCreacion)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            if (v.fechaActualizacion.isAfter(v.fechaCreacion))
                              Text(
                                'Actualizado: ${Formateadores.formatearFecha(v.fechaActualizacion)}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),

                            const SizedBox(height: 20),

                            // Botones
                            // Botones de acción
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (!v.activo && widget.esAdministrador)
                                  ElevatedButton.icon(
                                    onPressed: widget.onReactivar,
                                    icon: const Icon(Icons.restore, size: 18),
                                    label: const Text("Reactivar"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green.shade600,
                                    foregroundColor: Colors.white,
                                    ),
                                  )
                                else ...[
                                  OutlinedButton.icon(
                                    onPressed: widget.onEdit,
                                    icon: const Icon(Icons.edit, size: 18),
                                    label: const Text("Editar"),
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      side: BorderSide(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  OutlinedButton.icon(
                                    onPressed: widget.onDelete,
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                                    label: const Text(
                                      "Eliminar",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      side: const BorderSide(color: Colors.red),
                                    ),
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

  Widget _detalleRegistros(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.indigo.shade400),
          const SizedBox(width: 12),
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
