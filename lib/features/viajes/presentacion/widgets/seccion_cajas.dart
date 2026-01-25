import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeccionCajas extends ConsumerWidget {
  final String viajeIdExterno;

  const SeccionCajas({super.key, required this.viajeIdExterno});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cargasAsync = ref.watch(cargasPorViajeProvider(viajeIdExterno));

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: const Icon(Icons.inventory, color: Colors.green),
        title: const Text(
          'Cargas de cajas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        childrenPadding: const EdgeInsets.all(8),
        children: cargasAsync.when(
          data: (cargas) => cargas.isEmpty
              ? [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Aún no hay cargas registradas',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ]
              : cargas
                    .map(
                      (carga) => ListTile(
                        leading: const Icon(Icons.check_circle_outline),
                        // En seccion_cajas.dart, dentro del map:
                        title: Text(
                          '${carga['cajas']} cajas',
                        ), // 'cajas', no 'cantidadCajas'
                        subtitle: Text(
                          '${carga['hacienda']} → ${carga['cliente']}',
                        ),
                        trailing: Text('Total: \$${carga['totalCompra']}'),
                      ),
                    )
                    .toList(),
          loading: () => [const Center(child: CircularProgressIndicator())],
          error: (_, __) => [const Text('Error cargando cargas')],
        ),
      ),
    );
  }
}
