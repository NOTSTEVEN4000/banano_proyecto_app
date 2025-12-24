import 'package:flutter/material.dart';

class ViajeCard extends StatelessWidget {
  final String titulo;
  final String vehiculo;
  final String estado;
  final VoidCallback onTap;

  const ViajeCard({
    super.key,
    required this.titulo,
    required this.vehiculo,
    required this.estado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(titulo),
        subtitle: Text('Vehículo: $vehiculo'),
        trailing: Chip(label: Text(estado)),
        onTap: onTap,
      ),
    );
  }
}
