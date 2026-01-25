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

  Color _getAvatarColor() {
    if (!cliente.activo) return Colors.red.shade700;
    if (cliente.pendienteSync) return Colors.orange.shade700;
    return Colors.indigo.shade600;
  }

  @override
  Widget build(BuildContext context) {
    final tienePendiente = showPendingBadge || cliente.pendienteSync;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // Menos margen vertical
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetalleClientePage(clienteInicial: cliente),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14), // Menos padding
          child: Row(
            children: [
              // Avatar más pequeño y elegante
              CircleAvatar(
                radius: 26,
                backgroundColor: _getAvatarColor(),
                child: Text(
                  cliente.nombre.isNotEmpty ? cliente.nombre[0].toUpperCase() : '?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // Información principal (más compacta)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cliente.nombre,
                      style: const TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        // Tag de estado más pequeño
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: getColorPorEstado(cliente.estado),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            cliente.estado,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // RUC más sutil
                        if (cliente.rucCi != null && cliente.rucCi!.isNotEmpty)
                          Flexible(
                            child: Text(
                              cliente.rucCi!,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              // Precio y badge pendiente (más alineado)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Formateadores.formatearPrecio(cliente.precioActual, cliente.moneda),
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  if (tienePendiente)
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.cloud_upload,
                        size: 18,
                        color: Colors.orange,
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}