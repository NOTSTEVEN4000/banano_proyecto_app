// lib/features/proveedores/presentacion/widgets/proveedor_card.dart

import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:banano_proyecto_app/features/proveedores/presentacion/pages/detalle_proveedor_page.dart';
import 'package:flutter/material.dart';

class ProveedorCard extends StatelessWidget {
  final ProveedorEntity proveedor;

  const ProveedorCard({super.key, required this.proveedor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetalleProveedorPage(proveedor: proveedor),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: _getAvatarColor(),
                child: Text(
                  proveedor.nombre.isNotEmpty ? proveedor.nombre[0].toUpperCase() : '?',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      proveedor.nombre,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                        color: getColorPorEstado(proveedor.estado),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        proveedor.estado,
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (proveedor.rucCi != null && proveedor.rucCi!.isNotEmpty)
                      Text(
                        'RUC/CI: ${proveedor.rucCi}',
                        style: TextStyle(color: Colors.grey.shade800, fontSize: 14),
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    proveedor.precioFormateado,
                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  if (proveedor.saldoPorPagar > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Debo: ${proveedor.saldoFormateado}',
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Color _getAvatarColor() {
    if (!proveedor.activo) return Colors.red.shade700;
    if (proveedor.pendienteSync) return Colors.orange.shade700;
    return Colors.green.shade600;
  }
}