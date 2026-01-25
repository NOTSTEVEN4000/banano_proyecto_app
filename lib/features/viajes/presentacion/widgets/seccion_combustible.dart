import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/agregar_combustible_page.dart';

class SeccionCombustible extends ConsumerWidget {
  final String viajeIdExterno;
  final bool readOnly; // <--- Agregar esto

  const SeccionCombustible({
    super.key,
    required this.viajeIdExterno,
    this.readOnly = false, // <--- Agregar esto
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final combustibleAsync = ref.watch(
      combustiblePorViajeProvider(viajeIdExterno),
    );

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: const Icon(Icons.local_gas_station, color: Colors.orange),
        title: const Text(
          'Combustible',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        childrenPadding: const EdgeInsets.all(8),
        children: [
          // 1. Lista de recargas existentes
          combustibleAsync.when(
            data: (recargas) => recargas.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Aún no hay recargas registradas',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Column(
                    children: recargas
                        .map(
                          (rec) => ListTile(
                            leading: const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                            title: Text('${rec['monto']} USD'),
                            subtitle: Text(
                              '${rec['fecha']} • ${rec['litros']} litros',
                            ),
                            trailing: rec['detalle'].toString().isNotEmpty
                                ? Text(
                                    rec['detalle'],
                                    style: const TextStyle(fontSize: 12),
                                  )
                                : null,
                          ),
                        )
                        .toList(),
                  ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const Text('Error cargando combustible'),
          ),

          const Divider(height: 24, thickness: 1),

          // 2. Botón para agregar nueva recarga
          if (!readOnly) ...[
            const Divider(height: 24, thickness: 1),
            ListTile(
              leading: const Icon(
                Icons.add_circle_outline,
                color: Colors.orange,
              ),
              title: const Text('Agregar nueva recarga'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        AgregarCombustiblePage(viajeIdExterno: viajeIdExterno),
                  ),
                ).then((_) {
                  // Refresca solo esta sección después de agregar
                  ref.invalidate(combustiblePorViajeProvider(viajeIdExterno));
                });
              },
            ),
          ],
        ],
      ),
    );
  }
}
