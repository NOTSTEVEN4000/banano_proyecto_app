import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/agregar_carga_cajas_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarCargaCajasPage extends ConsumerStatefulWidget {
  final ViajeEntity viaje; // Recibimos el objeto completo

  const AgregarCargaCajasPage({super.key, required this.viaje});

  @override
  ConsumerState<AgregarCargaCajasPage> createState() => _AgregarCargaCajasPageState();
}

class _AgregarCargaCajasPageState extends ConsumerState<AgregarCargaCajasPage> {
  final _cantidadController = TextEditingController();
  final _costoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Cantidad de Cajas')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // CARD INFORMATIVO DE ORIGEN Y DESTINO
          Card(
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _infoRow(Icons.location_on, 'Origen (Proveedor)', widget.viaje.haciendaIdExterno ?? 'No asignado'),
                  const Divider(),
                  _infoRow(Icons.flag, 'Destino (Cliente)', widget.viaje.clienteIdExterno ?? 'No asignado'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          TextFormField(
            controller: _cantidadController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Cantidad de cajas *',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.numbers),
            ),
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: _costoController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Costo unitario sugerido *',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.attach_money),
            ),
          ),
          const SizedBox(height: 32),

          FilledButton.icon(
            onPressed: _guardar,
            icon: const Icon(Icons.save),
            label: const Text('Confirmar Carga'),
            style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
            Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Future<void> _guardar() async {
    final cantidad = int.tryParse(_cantidadController.text);
    final costo = double.tryParse(_costoController.text);

    if (cantidad == null || costo == null) {
      MensajesGlobales.advertencia('Ingrese valores válidos');
      return;
    }

    try {
      final dto = AgregarCargaCajasDto(
        idExterno: 'CC-${DateTime.now().millisecondsSinceEpoch}',
        proveedorIdExterno: widget.viaje.haciendaIdExterno!, // Tomado del viaje
        haciendaIdExterno: widget.viaje.haciendaIdExterno ?? 'H-001', 
        cantidadCajas: cantidad,
        costoCompraUnitario: costo,
        clienteIdExterno: widget.viaje.clienteIdExterno, // Tomado del viaje
        precioVentaUnitario: 0.0,
      );

      await ref.read(viajesControllerProvider.notifier)
          .agregarCargaCajas(widget.viaje.idExterno, dto);
      
      if (mounted) Navigator.pop(context);
    } catch (e) {
      MensajesGlobales.error('Error: $e');
    }
  }
}
