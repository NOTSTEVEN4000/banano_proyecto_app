import 'package:banano_proyecto_app/features/viajes/presentacion/widgets/seccion_cajas.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/widgets/seccion_combustible.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/widgets/seccion_insumos.dart';
import 'package:flutter/material.dart';

class ViajeDetallePage extends StatelessWidget {
  const ViajeDetallePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del viaje')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SeccionInsumos(),
          SizedBox(height: 12),
          SeccionCombustible(),
          SizedBox(height: 12),
          SeccionCajas(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: FilledButton(
          onPressed: () {},
          child: const Text('Cerrar viaje'),
        ),
      ),
    );
  }
}
