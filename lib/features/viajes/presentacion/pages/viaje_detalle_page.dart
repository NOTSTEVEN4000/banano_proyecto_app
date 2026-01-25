import 'package:banano_proyecto_app/features/viajes/data/models/entregar_viaje_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/agregar_carga_cajas_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/widgets/seccion_insumos.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/widgets/seccion_combustible.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/widgets/seccion_cajas.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';

class ViajeDetallePage extends ConsumerWidget {
  final String idExterno;
  const ViajeDetallePage({super.key, required this.idExterno});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viajeAsync = ref.watch(viajeProvider(idExterno));
    final vehiculosAsync = ref.watch(vehiculosControllerProvider);
    // Necesitamos los proveedores para obtener los nombres de Hacienda/Cliente
    final proveedoresAsync = ref.watch(proveedoresControllerProvider); 

    return viajeAsync.when(
      data: (viaje) {
        final esInsumos = viaje.tipo == TipoViaje.INSUMOS;
        final esCajas = viaje.tipo == TipoViaje.CAJAS;
        final yaFinalizo = viaje.estado == EstadoViaje.ENTREGADO || viaje.estado == EstadoViaje.ANULADO;

        // 1. OBTENER INFO VEHÍCULO
        final infoVehiculo = vehiculosAsync.maybeWhen(
          data: (list) {
            final v = list.firstWhere((e) => e.idExterno == viaje.vehiculoIdExterno);
            return '${v.marca} ${v.modelo} (${v.placa})';
          },
          orElse: () => 'Cargando...',
        );

        // 2. OBTENER NOMBRE DEL PROVEEDOR (Hacienda/Origen)
        final nombreProveedor = proveedoresAsync.maybeWhen(
          data: (list) => list.firstWhere(
            (e) => e.idExterno == viaje.haciendaIdExterno,
            orElse: () => list.first, // Fallback por si no lo encuentra
          ).nombre,
          orElse: () => '...',
        );

        // 3. OBTENER NOMBRE DEL CLIENTE (Destino final cajas)
        String? nombreCliente;
        if (esCajas) {
          nombreCliente = proveedoresAsync.maybeWhen(
            data: (list) => list.firstWhere(
              (e) => e.idExterno == viaje.clienteIdExterno,
              orElse: () => list.first,
            ).nombre,
            orElse: () => '...',
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text('Detalle del Viaje')),
          body: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 140),
                children: [
                  // CABECERA DINÁMICA
                  _buildHeaderM3(context, viaje, infoVehiculo, nombreProveedor, nombreCliente),
                  
                  const SizedBox(height: 20),

                  // SECCIÓN DE NOTAS (Solo si ya entregó)
                  if (yaFinalizo && viaje.notas != null) ...[
                    _sectionTitle('Notas de Entrega', Icons.comment),
                    _buildNotasCard(context, viaje.notas!),
                    const SizedBox(height: 12),
                  ],

                  if (esInsumos) ...[
                    _sectionTitle('Insumos Entregados', Icons.inventory_2),
                    SeccionInsumos(viajeIdExterno: idExterno, readOnly: yaFinalizo),
                  ],

                  if (esCajas) ...[
                    _sectionTitle('Cajas Recolectadas', Icons.inventory),
                    SeccionCajas(viajeIdExterno: idExterno),
                    if (!yaFinalizo) 
                      FilledButton.tonalIcon(
                        onPressed: () => _goCajas(context, ref, viaje),
                        icon: const Icon(Icons.add),
                        label: const Text('Registrar Carga de Cajas'),
                      ),
                  ],

                  const SizedBox(height: 12),
                  _sectionTitle('Combustible', Icons.local_gas_station),
                  SeccionCombustible(viajeIdExterno: idExterno, readOnly: yaFinalizo),
                ],
              ),
              if (!yaFinalizo)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildBarraAccion(context, ref, viaje),
                ),
            ],
          ),
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, st) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }

  // --- COMPONENTES UI MEJORADOS ---

  Widget _buildHeaderM3(
    BuildContext context,
    ViajeEntity viaje,
    String infoVehiculo,
    String proveedor,
    String? cliente,
  ) {
    final color = _getColor(viaje.estado);
    final esCajas = viaje.tipo == TipoViaje.CAJAS;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: Text(viaje.estado.name),
                backgroundColor: color.withOpacity(0.2),
                side: BorderSide.none,
              ),
              Text(viaje.idExterno, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(height: 24),
          
          // Fila 1: Vehículo y Tipo
          Row(
            children: [
              Expanded(child: _headerItem(context, 'Vehículo', infoVehiculo, Icons.local_shipping)),
              Expanded(child: _headerItem(context, 'Tipo de Viaje', viaje.tipo.name, Icons.category)),
            ],
          ),
          const SizedBox(height: 16),
          
          // Fila 2: Origen y Destino (Diferenciado por tipo)
          Row(
            children: [
              Expanded(
                child: _headerItem(
                  context, 
                  esCajas ? 'Recolectado en' : 'Destino Insumos', 
                  proveedor, 
                  Icons.location_on
                )
              ),
              if (esCajas && cliente != null)
                Expanded(
                  child: _headerItem(context, 'Entregar a (Cliente)', cliente, Icons.store)
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerItem(BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14, color: Colors.blueGrey),
            const SizedBox(width: 4),
            Text(label, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildNotasCard(BuildContext context, String nota) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Observaciones del cierre:', 
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.brown)),
          const SizedBox(height: 4),
          Text(nota, style: const TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const Expanded(child: Divider(indent: 10)),
        ],
      ),
    );
  }

  Widget _buildBarraAccion(
    BuildContext context,
    WidgetRef ref,
    ViajeEntity viaje,
  ) {
    final esInicio = viaje.estado == EstadoViaje.CREADO;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: FilledButton.icon(
          style: FilledButton.styleFrom(
            backgroundColor: esInicio ? null : Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => _manejarAccionPrincipal(context, ref, viaje),
          icon: Icon(esInicio ? Icons.play_arrow : Icons.check_circle_outline),
          label: Text(esInicio ? 'INICIAR VIAJE' : 'FINALIZAR VIAJE'),
        ),
      ),
    );
  }

  // --- LÓGICA MEJORADA ---

  Future<void> _manejarAccionPrincipal(
    BuildContext context,
    WidgetRef ref,
    ViajeEntity viaje,
  ) async {
    final esInicio = viaje.estado == EstadoViaje.CREADO;

if (esInicio) {
    // 1. VALIDACIÓN DE INSUMOS ANTES DE INICIAR
    if (viaje.tipo == TipoViaje.INSUMOS) {
      final insumosAsync = ref.refresh(insumosPorViajeProvider(idExterno));
      final tieneDatos = insumosAsync.maybeWhen(
        data: (list) => list.isNotEmpty,
        orElse: () => false,
      );

      if (!tieneDatos) {
        MensajesGlobales.error(
          'No puede iniciar: Debe registrar al menos un insumo primero.',
        );
        return;
      }
    }else if (viaje.tipo == TipoViaje.CAJAS) {
    // VALIDACIÓN PARA CAJAS
    final cargasAsync = ref.read(cargasPorViajeProvider(idExterno)); // Asegúrate que este provider exista
    final tieneCajas = cargasAsync.maybeWhen(
      data: (list) => list.isNotEmpty,
      orElse: () => false,
    );

    if (!tieneCajas) {
      MensajesGlobales.error('Debe registrar la carga de cajas antes de iniciar el viaje.');
      return;
    }
  }
}

    // 2. DIÁLOGO DE CONFIRMACIÓN
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(esInicio ? '¿Iniciar Viaje?' : '¿Finalizar Viaje?'),
        content: Text(
          esInicio
              ? 'Se registrará el inicio del viaje. ¿Desea continuar?'
              : 'Se cerrará el registro del viaje. No podrá agregar más combustible o insumos.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('CANCELAR'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('CONFIRMAR'),
          ),
        ],
      ),
    );

    if (confirmar != true) return;

    // 3. EJECUCIÓN
    // ... dentro de _manejarAccionPrincipal
try {
  if (esInicio) {
    await ref.read(viajesControllerProvider.notifier).iniciar(idExterno);
    // QUITAMOS el mensaje de éxito de aquí porque el controlador ya lo lanza
  } else {
    await ref.read(viajesControllerProvider.notifier).entregar(
      idExterno,
      EntregarViajeDto(observacion: 'Finalizado desde App'),
    );
  }
  
  // IMPORTANTE: Invalida AMBOS para asegurar que la lista y el detalle se sincronicen
  ref.invalidate(viajesControllerProvider); 
  ref.invalidate(viajeProvider(idExterno));

} catch (e) {
  MensajesGlobales.error('Error: $e');
}
  }

  void _goCajas(BuildContext context, WidgetRef ref, ViajeEntity viaje) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => AgregarCargaCajasPage(viaje: viaje),
    ),
  ).then((_) {
    // IMPORTANTE: Invalidar el provider de las cajas para que la lista se refresque
    ref.invalidate(cargasPorViajeProvider(idExterno)); 
    ref.invalidate(viajeProvider(idExterno));
  });
}

  Color _getColor(EstadoViaje e) {
    switch (e) {
      case EstadoViaje.CREADO:
        return Colors.blue;
      case EstadoViaje.EN_RUTA:
        return Colors.orange;
      case EstadoViaje.ENTREGADO:
        return Colors.green;
      case EstadoViaje.ANULADO:
        return Colors.red;
    }
  }
}
