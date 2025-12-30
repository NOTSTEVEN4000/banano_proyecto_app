import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Buscador reutilizable SOLO para búsqueda por texto
/// Optimizado para rendimiento máximo y sin errores de cast
class BuscadorReutilizable<T> extends ConsumerStatefulWidget {
  final String hintBusqueda;
  final StateProvider<T> filtroProvider;

  const BuscadorReutilizable({
    super.key,
    required this.hintBusqueda,
    required this.filtroProvider,
  });

  @override
  ConsumerState<BuscadorReutilizable<T>> createState() => _BuscadorReutilizableState<T>();
}

class _BuscadorReutilizableState<T> extends ConsumerState<BuscadorReutilizable<T>> {
  late final TextEditingController _controller;
  String _ultimaQuery = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _sincronizarConProvider();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sincronizarConProvider() {
    final filtroActual = ref.read(widget.filtroProvider);
    final query = (filtroActual as dynamic).searchQuery as String? ?? '';
    
    if (_controller.text != query) {
      _controller.text = query;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: query.length),
      );
    }
    _ultimaQuery = query;
  }

  void _actualizarBusqueda(String value) {
    final trimmed = value.trim();
    if (_ultimaQuery == trimmed) return;

    final filtroActual = ref.read(widget.filtroProvider);
    // Usamos copyWith directamente → seguro y rápido
    final nuevoFiltro = (filtroActual as dynamic).copyWith(searchQuery: trimmed) as T;

    ref.read(widget.filtroProvider.notifier).state = nuevoFiltro;
    _ultimaQuery = trimmed;
  }

  void _limpiar() {
    _controller.clear();
    _actualizarBusqueda('');
  }

  @override
  Widget build(BuildContext context) {
    // Escucha cambios externos para sincronizar el campo
    ref.listen<T>(widget.filtroProvider, (_, _) {
      _sincronizarConProvider();
    });

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: TextField(
        controller: _controller,
        onChanged: _actualizarBusqueda,
        decoration: InputDecoration(
          hintText: widget.hintBusqueda,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _limpiar,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}