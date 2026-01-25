import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:banano_proyecto_app/di/providers.dart'; // Asegúrate de tener viajesControllerProvider
import 'package:banano_proyecto_app/features/viajes/presentacion/widgets/viaje_card.dart';

class ViajesPage extends ConsumerWidget {
  const ViajesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Carga automática al entrar
    ref.listen(viajesControllerProvider, (_, state) {
      state.whenData((viajes) {
        // Opcional: refrescar algo más
      });
    });

    final viajesAsync = ref.watch(viajesControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Viajes del día'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                ref.read(viajesControllerProvider.notifier).cargarMisViajes(),
          ),
        ],
      ),
      body: viajesAsync.when(
        data: (viajes) => viajes.isEmpty
            ? const Center(child: Text('No hay viajes hoy'))
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: viajes.length,
                // Dentro del ListView.builder de ViajesPage
                itemBuilder: (context, index) {
                  final viaje = viajes[index];
                  return ViajeCard(
                    // Usamos el tipo de viaje o fecha como título para no mostrar IDs raros
                    titulo:
                        "${viaje.tipo.name} - ${viaje.idExterno.substring(0, 5)}",
                    vehiculoId:
                        viaje.vehiculoIdExterno, // Pasamos el ID técnico
                    estado: viaje.estado.name,
                    onTap: () =>
                        context.push('/viajes/detalle/${viaje.idExterno}'),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/viajes/nuevo'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
