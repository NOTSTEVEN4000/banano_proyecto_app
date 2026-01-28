import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeccionCajas extends ConsumerWidget {
  final String viajeIdExterno;

  const SeccionCajas({super.key, required this.viajeIdExterno});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Escuchamos los providers de datos y catálogos
    final cargasAsync = ref.watch(cargasPorViajeProvider(viajeIdExterno));
    final proveedoresAsync = ref.watch(proveedoresControllerProvider);
    final clientesAsync = ref.watch(clientesControllerProvider);

    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // 2. Validación en cascada (Espera a que los catálogos carguen)
    return proveedoresAsync.when(
      loading: () => const Center(child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator())),
      error: (err, _) => Center(child: Text('Error proveedores: $err')),
      data: (listaProveedores) {
        return clientesAsync.when(
          loading: () => const Center(child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator())),
          error: (err, _) => Center(child: Text('Error clientes: $err')),
          data: (listaClientes) {
            return cargasAsync.when(
              loading: () => const Center(child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator())),
              error: (err, _) => Center(child: Text('Error cargas: $err')),
              data: (cargas) {
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.5)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    leading: CircleAvatar(
                      backgroundColor: colorScheme.primaryContainer,
                      child: Icon(Icons.inventory_2_rounded, color: colorScheme.primary, size: 20),
                    ),
                    title: const Text('Detalle de Cargas', style: TextStyle(fontWeight: FontWeight.bold)),
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    children: cargas.isEmpty
                        ? [const Padding(padding: EdgeInsets.all(24), child: Text('No hay registros de carga'))]
                        : cargas.map((carga) {
                            
                            // --- LÓGICA DE BÚSQUEDA IGUAL A TU REGISTRO ---
                            final String hId = (carga['haciendaIdExterno'] ?? '').toString().trim();
                            final String cId = (carga['clienteIdExterno'] ?? '').toString().trim();

                            // Buscamos el objeto completo en el catálogo
                            final proveedor = listaProveedores.where((p) => p.idExterno.toString().trim() == hId).firstOrNull;
                            final cliente = listaClientes.where((c) => c.idExterno.toString().trim() == cId).firstOrNull;

                            // Nombres con fallback
                            final nombreHacienda = proveedor?.nombre ?? 'Hacienda no encontrada';
                            final nombreCliente = cliente?.nombre ?? 'Venta Local / No asignado';
                            
                            // Cálculo del total
                            final double total = (carga['totalCompra'] ?? 0.0).toDouble();

                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: isDark 
                                    ? colorScheme.surfaceContainerHighest.withOpacity(0.3) 
                                    : colorScheme.surfaceVariant.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    // BADGE DE CANTIDAD (Estilo visual mejorado)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD4E157), // Tu color lima característico
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            '${carga['cajas']}',
                                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                          ),
                                          const Text(
                                            'CAJAS',
                                            style: TextStyle(color: Colors.black54, fontSize: 8, fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // INFORMACIÓN DE DESTINO Y ORIGEN
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            nombreCliente, // <--- Tu Cliente
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              const Icon(Icons.location_on, size: 14, color: Color(0xFFD4E157)),
                                              const SizedBox(width: 4),
                                              Expanded(
                                                child: Text(
                                                  nombreHacienda, // <--- Tu Hacienda
                                                  style: TextStyle(fontSize: 11, color: colorScheme.onSurfaceVariant),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // TOTAL MEJORADO
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Text('TOTAL', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)),
                                        Text(
                                          '\$${total.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xFF66BB6A), // Verde para el dinero
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}