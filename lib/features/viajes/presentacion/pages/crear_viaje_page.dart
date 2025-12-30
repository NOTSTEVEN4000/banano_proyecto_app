import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CrearViajePage extends StatefulWidget {
  const CrearViajePage({super.key});

  @override
  State<CrearViajePage> createState() => _CrearViajePageState();
}

class _CrearViajePageState extends State<CrearViajePage> {
  String vehiculo = 'MI_CARRO';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo viaje')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField(
              initialValue: vehiculo,
              items: const [
                DropdownMenuItem(value: 'MI_CARRO', child: Text('Mi carro')),
                DropdownMenuItem(value: 'AMIGO', child: Text('Carro de amigo')),
              ],
              onChanged: (v) => setState(() => vehiculo = v!),
              decoration: const InputDecoration(
                labelText: 'Vehículo',
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                // Aquí llamarías al backend o guardarías local
                context.push('/viajes/detalle/1');
              },
              child: const Text('Iniciar viaje'),
            )
          ],
        ),
      ),
    );
  }
}
