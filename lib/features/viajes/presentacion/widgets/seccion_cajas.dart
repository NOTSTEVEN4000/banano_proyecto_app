import 'package:flutter/material.dart';

class SeccionCajas extends StatelessWidget {
  const SeccionCajas({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        leading: const Icon(Icons.inventory),
        title: const Text('Cajas'),
        children: [
          ListTile(
            title: const Text('Registrar cajas traídas'),
            trailing: const Icon(Icons.add),
            onTap: () {
              // Modal: hacienda, cantidad, costo
            },
          )
        ],
      ),
    );
  }
}
