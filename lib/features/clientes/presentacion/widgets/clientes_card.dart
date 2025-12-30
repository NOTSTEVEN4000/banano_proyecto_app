import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:banano_proyecto_app/core/utils/formateadores.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:flutter/material.dart';

class ClienteCard extends StatefulWidget {
  final ClienteEntity cliente;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onReactivar;
  final bool showPendingBadge;
  final bool esAdministrador;

  const ClienteCard({
    super.key,
    required this.cliente,
    this.onEdit,
    this.onDelete,
    this.onReactivar,
    this.showPendingBadge = false,
    required this.esAdministrador,
  });

  @override
  State<ClienteCard> createState() => _ClienteCardState();
}

class _ClienteCardState extends State<ClienteCard> {
  bool _expanded = false;

  Color _getCardColor() {
    if (!widget.cliente.activo) return const Color.fromARGB(255, 250, 219, 222);
    if (widget.cliente.pendienteSync) return Colors.orange.shade50;
    return const Color.fromARGB(255, 231, 245, 244);
  }

  Color _getAvatarColor() {
    if (!widget.cliente.activo) return Colors.red.shade700;
    if (widget.cliente.pendienteSync) return Colors.orange.shade700;
    return Colors.indigo.shade600;
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.cliente;
    final tienePendiente = widget.showPendingBadge || c.pendienteSync;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      elevation: 10,
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
                      c.nombre.isNotEmpty ? c.nombre[0].toUpperCase() : '?',
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
                        // LÍNEA 1: NOMBRE (grande)
                        Text(
                          c.nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 8),

                        // LÍNEA 2: ESTADO (badge)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: getColorPorEstado(c.estado),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            c.estado,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        // LÍNEA 3: RUC/CI en dos líneas separadas
                        if (c.rucCi != null && c.rucCi!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'RUC/CI:',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                c.rucCi!,
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  // Precio actual
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Formateadores.formatearPrecio(c.precioActual, c.moneda),
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
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
                duration: const Duration(milliseconds: 200),
                child: _expanded
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            const SizedBox(height: 10),

                            // Contacto
                            const Text(
                              'Contacto',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            _detalleRegistros(
                              Icons.person,
                              'Nombre',
                              c.contactoNombre,
                            ),
                            _detalleRegistros(
                              Icons.phone,
                              'Teléfono',
                              c.contactoTelefono,
                            ),
                            if (c.contactoCorreo != null &&
                                c.contactoCorreo!.isNotEmpty)
                              _detalleRegistros(
                                Icons.email,
                                'Correo',
                                c.contactoCorreo!,
                              ),

                            const SizedBox(height: 16),

                            // Dirección
                            const Text(
                              'Dirección',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            _detalleRegistros(
                              Icons.location_on,
                              'Provincia',
                              c.direccionProvincia,
                            ),
                            _detalleRegistros(
                              Icons.location_city,
                              'Ciudad',
                              c.direccionCiudad,
                            ),
                            _detalleRegistros(
                              Icons.home,
                              'Detalle',
                              c.direccionDetalle,
                            ),

                            const SizedBox(height: 16),

                            // Precio y saldo
                            const Text(
                              'Tarifa y Saldo',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            _detalleRegistros(
                              Icons.attach_money,
                              'Precio actual',
                              '${c.moneda} ${c.precioActual.toStringAsFixed(2)}',
                            ),

                            //
                            // _detalleRegistros(Icons.account_balance_wallet, 'Por cobrar', '\$${c.saldoTotalPorCobrar.toStringAsFixed(2)}'),
                            if (c.observaciones != null &&
                                c.observaciones!.isNotEmpty) ...[
                              const SizedBox(height: 16),
                              const Text(
                                'Observaciones',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _detalleRegistros(
                                Icons.note,
                                '',
                                c.observaciones!,
                              ),
                            ],

                            const SizedBox(height: 16),
                            Text(
                              'Creado: ${Formateadores.formatearFecha(c.fechaCreacion)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            if (c.fechaActualizacion.isAfter(c.fechaCreacion))
                              Text(
                                'Actualizado: ${Formateadores.formatearFecha(c.fechaActualizacion)}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),

                            const SizedBox(height: 20),

                            // Botones de acción
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (!c.activo && widget.esAdministrador)
                                  ElevatedButton.icon(
                                    onPressed: widget.onReactivar,
                                    icon: const Icon(Icons.restore, size: 18),
                                    label: const Text("Reactivar"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green.shade600,
                                      foregroundColor: Colors.white
                                    ),
                                  )
                                else ...[
                                  OutlinedButton.icon(
                                    onPressed: widget.onEdit,
                                    icon: const Icon(Icons.edit, size: 18),
                                    label: const Text("Editar"),
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
          if (label.isNotEmpty)
            SizedBox(
              width: 100,
              child: Text(
                '$label:',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            )
          else
            const SizedBox(width: 100),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
