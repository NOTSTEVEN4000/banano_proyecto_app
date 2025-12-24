import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResumenCard extends StatelessWidget {
  final String titulo;
  final String valor;

  const ResumenCard({super.key, required this.titulo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(titulo, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Text(
              valor,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
