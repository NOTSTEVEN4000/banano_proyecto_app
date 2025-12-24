import 'package:banano_proyecto_app/features/viajes/presentacion/pages/viaje_detalle_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/widgets/viaje_card.dart';
import 'package:flutter/material.dart';

class ViajesPage extends StatelessWidget {
  const ViajesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Viajes del día')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (_, i) {
          return ViajeCard(
            titulo: 'Viaje ${i + 1}',
            vehiculo: 'Camión rojo',
            estado: 'EN PROCESO',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ViajeDetallePage()),
              );
            },
          );
        },
      ),
    );
  }
}
