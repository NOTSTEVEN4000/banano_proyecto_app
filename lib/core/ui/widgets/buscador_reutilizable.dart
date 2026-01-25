import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuscadorReutilizable<T> extends ConsumerStatefulWidget {
  final String hintBusqueda;
  final StateProvider<T> filtroProvider;
  final Duration debounceDuration;
  final Function(String)? onSearch;

  const BuscadorReutilizable({
    super.key,
    required this.hintBusqueda,
    required this.filtroProvider,
    this.onSearch,
    this.debounceDuration = const Duration(milliseconds: 500),
  });

  @override
  ConsumerState<BuscadorReutilizable<T>> createState() => _BuscadorReutilizableState<T>();
}

class _BuscadorReutilizableState<T> extends ConsumerState<BuscadorReutilizable<T>> {
  Timer? _debounce;
  late final TextEditingController _controller;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

 // En buscador_reutilizable.dart

@override
void initState() {
  super.initState();
  // 1. Obtener valor inicial
  final initialValue = (ref.read(widget.filtroProvider) as dynamic).searchQuery ?? '';
  _controller = TextEditingController(text: initialValue);
  
  _controller.addListener(() {
    if (mounted) setState(() {});
  });

  // ESTA ES LA CLAVE: Escucha si el provider se resetea externamente
  ref.listenManual(widget.filtroProvider, (previous, next) {
    final newQuery = (next as dynamic).searchQuery ?? '';
    if (_controller.text != newQuery && mounted) {
      _controller.text = newQuery;
    }
  });
}

void _ejecutarBusqueda(String value) {
  // Verificamos que el widget siga montado antes de actualizar el estado
  if (!mounted) return;

  final notifier = ref.read(widget.filtroProvider.notifier);
  final filtroActual = notifier.state;
  
  // Actualizamos el estado usando copyWith
  notifier.state = (filtroActual as dynamic).copyWith(searchQuery: value.trim());

  if (widget.onSearch != null) {
    widget.onSearch!(value.trim());
  }
}

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(widget.debounceDuration, () => _ejecutarBusqueda(value));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: TextField(
          controller: _controller,
          onChanged: _onSearchChanged,
          textInputAction: TextInputAction.search,
          onSubmitted: (val) {
            _debounce?.cancel();
            _ejecutarBusqueda(val);
          },
          style: TextStyle(color: colorScheme.onSurface),
          decoration: InputDecoration(
            hintText: widget.hintBusqueda,
            hintStyle: TextStyle(color: colorScheme.onSurfaceVariant.withOpacity(0.7)),
            prefixIcon: Icon(Icons.search, color: colorScheme.primary),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close_rounded, color: colorScheme.outline),
                    onPressed: () {
                      _controller.clear();
                      _debounce?.cancel();
                      _ejecutarBusqueda('');
                      FocusScope.of(context).unfocus();
                    },
                  )
                : null,
            filled: true,
            // Uso de colores tonales de Material 3
            fillColor: isDark ? colorScheme.surfaceContainerHigh : Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            
            // Borde cuando no está seleccionado
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28), // Estilo "Pill" de M3
              borderSide: BorderSide(
                color: isDark 
                    ? colorScheme.outlineVariant.withOpacity(0.2) 
                    : colorScheme.outlineVariant.withOpacity(0.5),
              ),
            ),
            
            // Borde cuando está seleccionado (Focus)
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}