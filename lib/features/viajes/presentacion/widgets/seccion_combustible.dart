import 'package:flutter/material.dart';

class SeccionCombustible extends StatelessWidget {
  const SeccionCombustible({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: const Icon(Icons.local_gas_station),
        title: const Text('Combustible'),
        children: [
          ListTile(
            title: const Text('Agregar recarga'),
            trailing: const Icon(Icons.add),
            onTap: () {
              // Modal para ingresar monto
            },
          )
        ],
      ),
    );
  }
}
