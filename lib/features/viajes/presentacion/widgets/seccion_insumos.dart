import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/registrar_insumos_page.dart';

class SeccionInsumos extends ConsumerWidget {
 final String viajeIdExterno;
  final bool readOnly; // <--- Agregar esto

  const SeccionInsumos({
    super.key, 
    required this.viajeIdExterno, 
    this.readOnly = false, // <--- Por defecto false
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viajeAsync = ref.watch(viajeProvider(viajeIdExterno));
    final insumosAsync = ref.watch(insumosPorViajeProvider(viajeIdExterno));

    return viajeAsync.when(
      data: (viaje) {
        // Solo mostrar la sección si es viaje de insumos
        if (viaje.tipo != TipoViaje.INSUMOS) {
          return const SizedBox.shrink();
        }

        final puedeAgregar = viaje.estado == EstadoViaje.CREADO ||
                             viaje.estado == EstadoViaje.EN_RUTA;

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ExpansionTile(
            leading: const Icon(Icons.inventory_2, color: Colors.blue),
            title: const Text('Insumos entregados', style: TextStyle(fontWeight: FontWeight.bold)),
            childrenPadding: const EdgeInsets.all(8),
            children: [
              // 1. Lista de insumos registrados (reales desde BD)
              insumosAsync.when(
                data: (insumos) => insumos.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Aún no se han registrado insumos',
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Column(
                        children: insumos.map((item) => ListTile(
                          leading: const Icon(Icons.check_circle_outline, color: Colors.green),
                          title: Text(item['insumo']),
                          trailing: Text('${item['cantidad']} unidades'),
                        )).toList(),
                      ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) => const Text('Error cargando insumos'),
              ),

if (!readOnly && puedeAgregar) ...[                
  const Divider(height: 24, thickness: 1),

                // 2. Botón para agregar (ahora DENTRO del dropdown, como combustible)
                ListTile(
                  leading: const Icon(Icons.add_circle_outline, color: Colors.blue),
                  title: const Text('Agregar nuevos insumos'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegistrarInsumosPage(viajeIdExterno: viajeIdExterno),
                      ),
                    ).then((_) {
                      // Refresca solo esta sección después de agregar
                      ref.invalidate(insumosPorViajeProvider(viajeIdExterno));
                    });
                  },
                ),
              ],
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const Text('Error cargando viaje'),
    );
  }
}