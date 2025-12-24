import 'package:flutter/material.dart';

class SeccionInsumos extends StatelessWidget {
  const SeccionInsumos({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Insumos llevados', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Cartones: 50'),
            Text('Fundas: 50'),
            Text('Cartulinas: 50'),
          ],
        ),
      ),
    );
  }
}
