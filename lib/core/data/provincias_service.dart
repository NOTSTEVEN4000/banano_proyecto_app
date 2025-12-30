import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Canton {
  final int id;
  final String nombre;

  Canton({required this.id, required this.nombre});

  factory Canton.fromJson(Map<String, dynamic> json) {
    return Canton(
      id: json['id'],
      nombre: json['nombre'],
    );
  }
}

class Provincia {
  final int id;
  final String nombre;
  final List<Canton> cantones;

  Provincia({required this.id, required this.nombre, required this.cantones});

  factory Provincia.fromJson(Map<String, dynamic> json) {
    return Provincia(
      id: json['id'],
      nombre: json['nombre'],
      cantones: (json['cantones'] as List)
          .map((c) => Canton.fromJson(c))
          .toList(),
    );
  }
}

// Provider que carga el JSON una sola vez
final provinciasProvider = FutureProvider<List<Provincia>>((ref) async {
  try {
    final String response = await rootBundle.loadString('assets/data/ecuador_completo.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => Provincia.fromJson(json as Map<String, dynamic>)).toList();
  } catch (e, stack) {
    print('Error cargando provincias: $e');
    print(stack);
    rethrow;
  }
});