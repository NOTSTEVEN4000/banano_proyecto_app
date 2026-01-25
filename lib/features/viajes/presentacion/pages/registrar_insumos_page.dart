import 'dart:async';
import 'package:banano_proyecto_app/features/viajes/data/models/registrar_insumos_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:uuid/uuid.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class RegistrarInsumosPage extends ConsumerStatefulWidget {
  final String viajeIdExterno;

  const RegistrarInsumosPage({super.key, required this.viajeIdExterno});

  @override
  ConsumerState<RegistrarInsumosPage> createState() => _RegistrarInsumosPageState();
}

class _RegistrarInsumosPageState extends ConsumerState<RegistrarInsumosPage> {
  final List<Map<String, dynamic>> _items = [];
  Timer? _debounceTimer;
  final List<String> _insumosDisponibles = ['carton', 'funda', 'cartulina'];

  @override
  void initState() {
    super.initState();
    _cargarInsumosExistentes();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> _cargarInsumosExistentes() async {
    final insumos = await ref.read(insumosPorViajeProvider(widget.viajeIdExterno).future);
    if (insumos.isNotEmpty) {
      setState(() {
        _items.addAll(insumos.map((item) => {
              'insumo': item['insumo'].toString().toUpperCase(),
              'cantidad': item['cantidad'] as int,
            }));
      });
    }
  }

  void _guardarAutomatico() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 1500), () async {
      if (_items.isEmpty) return;
      try {
        final dto = RegistrarInsumosDto(
          idExterno: 'INS-${const Uuid().v4()}',
          haciendaIdExterno: ref.read(viajeProvider(widget.viajeIdExterno)).value?.haciendaIdExterno ?? '',
          items: _items,
        );
        await ref.read(viajesControllerProvider.notifier).actualizarInsumos(
              widget.viajeIdExterno,
              dto,
            );
      } catch (e) {
        debugPrint('Error en guardado automático: $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viajeAsync = ref.watch(viajeProvider(widget.viajeIdExterno));
    final haciendasAsync = ref.watch(proveedoresControllerProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return viajeAsync.when(
      data: (viaje) {
        final nombreHacienda = haciendasAsync.maybeWhen(
          data: (haciendas) => haciendas
              .firstWhereOrNull((h) => h.idExterno == viaje.haciendaIdExterno)
              ?.nombre ?? "Hacienda desconocida",
          orElse: () => "Cargando...",
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text('Entrega de Insumos'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                // COLOR DINÁMICO: Si es oscuro usa un gris muy oscuro, si es claro usa azul claro
                color: isDarkMode ? Colors.grey.shade900 : Colors.blue.shade50,
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: isDarkMode ? Colors.amber : Colors.blue),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Este es tu destino:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // COLOR DINÁMICO para el texto pequeño
                              color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade700,
                            ),
                          ),
                          Text(
                            '$nombreHacienda',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ID: ${viaje.haciendaIdExterno ?? "—"}',
                            style: TextStyle(
                              fontSize: 12,
                              color: isDarkMode ? Colors.grey.shade500 : Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _items.isEmpty
                    ? _buildEmptyState(isDarkMode)
                    : ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: _items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) => _buildInsumoCard(index, isDarkMode),
                      ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _mostrarModalAgregarInsumo(),
            icon: const Icon(Icons.add),
            label: const Text('Añadir Insumo'),
          ),
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }

  Widget _buildEmptyState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined, 
            size: 80, 
            color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300
          ),
          const SizedBox(height: 16),
          const Text(
            'Aún no has agregado insumos',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildInsumoCard(int index, bool isDarkMode) {
    final item = _items[index];
    return Dismissible(
      key: ValueKey(item['insumo']),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red.shade400,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        setState(() => _items.removeAt(index));
        _guardarAutomatico();
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200
          ),
        ),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.blue.withOpacity(0.1) : Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.category, color: Colors.blue),
          ),
          title: Text(
            item['insumo'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('${item['cantidad']} unidades'),
          trailing: IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () => _editarInsumo(index),
          ),
        ),
      ),
    );
  }

  // Los modales de BottomSheet suelen heredar el tema automáticamente, 
  // pero asegúrate de que los TextField no tengan colores fijos.
  void _mostrarModalAgregarInsumo() {
    String? selectedInsumo;
    final ctrl = TextEditingController(text: '1');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          left: 20, right: 20, top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nuevo Insumo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Tipo de Insumo', border: OutlineInputBorder()),
              items: _insumosDisponibles.map((i) => DropdownMenuItem(
                value: i.toUpperCase(),
                child: Text(i.toUpperCase()),
              )).toList(),
              onChanged: (v) => selectedInsumo = v,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cantidad', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            FilledButton(
              style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                if (selectedInsumo != null && int.tryParse(ctrl.text) != null) {
                  final cantidad = int.parse(ctrl.text);
                  final insumoMayus = selectedInsumo!;
                  final existe = _items.any((i) => i['insumo'] == insumoMayus);
                  if (existe) {
                    MensajesGlobales.advertencia('Este insumo ya está en la lista');
                  } else {
                    setState(() {
                      _items.add({'insumo': insumoMayus, 'cantidad': cantidad});
                    });
                    _guardarAutomatico();
                  }
                  Navigator.pop(ctx);
                }
              },
              child: const Text('Añadir'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _editarInsumo(int index) {
    final item = _items[index];
    final ctrl = TextEditingController(text: item['cantidad'].toString());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          left: 20, right: 20, top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Editar ${item['insumo']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cantidad', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            FilledButton(
              style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                final cantidad = int.tryParse(ctrl.text);
                if (cantidad != null && cantidad > 0) {
                  setState(() => _items[index]['cantidad'] = cantidad);
                  _guardarAutomatico();
                  Navigator.pop(ctx);
                } else {
                  MensajesGlobales.advertencia('Cantidad inválida');
                }
              },
              child: const Text('Actualizar'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}