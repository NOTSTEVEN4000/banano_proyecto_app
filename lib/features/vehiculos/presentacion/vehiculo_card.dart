import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/models/vehiculo_entity.dart';

class VehiculoCard extends StatefulWidget {
  final VehiculoEntity v;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool showPendingBadge;
  final bool esAdministrador;

  const VehiculoCard({
    super.key,
    required this.v,
    this.onEdit,
    this.onDelete,
    this.showPendingBadge = false,
    required this.esAdministrador,
  });

  @override
  State<VehiculoCard> createState() => _VehiculoCardState();
}

class _VehiculoCardState extends State<VehiculoCard> {
  bool _expanded = false;

  String formatearFecha(DateTime fecha) {
    final local = fecha.toLocal();
    return DateFormat('dd/MM/yyyy HH:mm').format(local);
  }

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
    } else if (tienePendiente) {
      return Colors.orange.shade600;
    } else {
      return Colors.green.shade600;
    }
  }

  Color _getEstadoColor(String? estado) {
    switch (estado?.toLowerCase()) {
      case 'operativo':
        return Colors.green.shade700;
      case 'en mantenimiento':
      case 'en reparación':
        return Colors.orange.shade700;
      case 'fuera de servicio':
      case 'baja temporal':
        return Colors.red.shade700;
      default:
        return Colors.grey.shade700;
    }
  }

  List<Widget> _buildInfoChips() {
    final List<Widget> chips = [];

    if (widget.v.marca.isNotEmpty) {
      chips.add(_chip(Icons.directions_car_filled, widget.v.marca));
    }

    if (widget.v.modelo.isNotEmpty) {
      chips.add(_chip(Icons.directions_car, widget.v.modelo));
    }
    
    if (widget.v.anio != null) {
      chips.add(_chip(Icons.calendar_today, 'Año ${widget.v.anio}'));
    }
    if (widget.v.capacidadCajas != null) {
      chips.add(_chip(Icons.inventory_2, '${widget.v.capacidadCajas} cajas'));
    }
    if (widget.v.kilometrajeActual != null) {
      chips.add(_chip(Icons.speed, '${widget.v.kilometrajeActual} km'));
    }
    if (widget.v.color != null && widget.v.color!.isNotEmpty) {
      chips.add(_chip(Icons.color_lens, widget.v.color!));
    }
    if (widget.v.conductorAsignadoNombre != null) {
      chips.add(_chip(Icons.person, widget.v.conductorAsignadoNombre!));
    }

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    final v = widget.v;
    final tienePendiente = widget.showPendingBadge || v.pendienteSync;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: _getCardColor(),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              // Cabecera
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: _getAvatarColor(),
                    child: Text(
                      v.nombre.isNotEmpty ? v.nombre[0].toUpperCase() : '?',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          v.nombre,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.confirmation_number, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              'Placa: ${v.placa}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            // Estado
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: _getEstadoColor(v.estado),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                v.estado ?? 'Sin estado',
                                style: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            // Pendiente
                            if (tienePendiente)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade600,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.cloud_upload, size: 16, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text(
                                      'Pendiente',
                                      style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Ícono expandir
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.keyboard_arrow_down, size: 28),
                  ),
                ],
              ),

              // Información expandida
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: _expanded
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(thickness: 1),
                            const SizedBox(height: 16),
                            // Chips de 2 en 2, más grandes y sin recorte
                            GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 3.8, // ← Más espacio vertical
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 14,
                              children: _buildInfoChips(),
                            ),
                            const SizedBox(height: 20),
                            // Fechas
                            Text(
                              'Creado: ${formatearFecha(v.fechaCreacion)}',
                              style: TextStyle(color: Colors.grey[700], fontSize: 14),
                            ),
                            if (v.fechaActualizacion.isAfter(v.fechaCreacion))
                              Text(
                                'Actualizado: ${formatearFecha(v.fechaActualizacion)}',
                                style: TextStyle(color: Colors.grey[700], fontSize: 14),
                              ),
                           

                            // Botones Editar y Eliminar (solo si activo)
                            if (v.activo)
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: widget.onEdit,
                                      icon: const Icon(Icons.edit, size: 20),
                                      label: const Text('Editar', style: TextStyle(fontSize: 16)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade600,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    ElevatedButton.icon(
                                      onPressed: widget.onDelete,
                                      icon: const Icon(Icons.delete, size: 20),
                                      label: const Text('Eliminar', style: TextStyle(fontSize: 16)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red.shade600,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                      ),
                                    ),
                                  ],
                                ),
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

  Widget _chip(IconData icon, String label) {
  // Especial para el conductor: más grande y permite 2 líneas
  if (icon == Icons.person) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 8, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  // Resto de chips normales
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.grey.shade300, width: 1),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}}