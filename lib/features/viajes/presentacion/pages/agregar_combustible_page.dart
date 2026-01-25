import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/agregar_combustible_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarCombustiblePage extends ConsumerStatefulWidget {
  final String viajeIdExterno;

  const AgregarCombustiblePage({super.key, required this.viajeIdExterno});

  @override
  ConsumerState<AgregarCombustiblePage> createState() => _AgregarCombustiblePageState();
}

class _AgregarCombustiblePageState extends ConsumerState<AgregarCombustiblePage> {
  final _montoCtrl = TextEditingController();
  final _litrosCtrl = TextEditingController();
  final _detalleCtrl = TextEditingController();

  bool _isSaving = false;

  @override
  void dispose() {
    _montoCtrl.dispose();
    _litrosCtrl.dispose();
    _detalleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Combustible'),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
            children: [
              // Tarjeta principal con campos
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título con icono grande
                      Row(
                        children: [
                          Icon(
                            Icons.local_gas_station_rounded,
                            size: 40,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Registrar recarga',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Campo Monto (obligatorio)
                      TextFormField(
                        controller: _montoCtrl,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: 'Monto USD *',
                          prefixIcon: Icon(Icons.attach_money, color: colorScheme.primary),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Requerido';
                          final monto = double.tryParse(value);
                          if (monto == null || monto <= 0) return 'Debe ser mayor a 0';
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),

                      // Campo Litros (opcional)
                      TextFormField(
                        controller: _litrosCtrl,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: 'Litros (opcional)',
                          prefixIcon: Icon(Icons.opacity, color: colorScheme.primary),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) return null;
                          final litros = double.tryParse(value);
                          if (litros == null || litros <= 0) return 'Debe ser mayor a 0';
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),

                      // Campo Detalle
                      TextFormField(
                        controller: _detalleCtrl,
                        decoration: InputDecoration(
                          labelText: 'Detalle / Estación (opcional)',
                          prefixIcon: Icon(Icons.notes, color: colorScheme.primary),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                        ),
                        maxLines: 2,
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // FAB flotante para guardar (más accesible y moderno)
          Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButton.extended(
              onPressed: _isSaving ? null : _guardarCombustible,
              icon: _isSaving
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    )
                  : const Icon(Icons.save),
              label: Text(_isSaving ? 'Guardando...' : 'Guardar recarga'),
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              elevation: 6,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _guardarCombustible() async {
    // Validación manual (más control)
    final montoStr = _montoCtrl.text.trim();
    final litrosStr = _litrosCtrl.text.trim();
    final detalle = _detalleCtrl.text.trim();

    if (montoStr.isEmpty) {
      MensajesGlobales.advertencia('Ingrese el monto en USD');
      return;
    }

    final monto = double.tryParse(montoStr);
    if (monto == null || monto <= 0) {
      MensajesGlobales.advertencia('Monto debe ser mayor a 0');
      return;
    }

    double? litros;
    if (litrosStr.isNotEmpty) {
      litros = double.tryParse(litrosStr);
      if (litros == null || litros <= 0) {
        MensajesGlobales.advertencia('Litros deben ser mayor a 0');
        return;
      }
    }

    setState(() => _isSaving = true);

    try {
      final dto = AgregarCombustibleDto(
        idExterno: 'COMB-${DateTime.now().millisecondsSinceEpoch}',
        fechaHora: DateTime.now(),
        montoUSD: monto,
        litros: litros,
        detalle: detalle.isEmpty ? null : detalle,
      );

      await ref.read(viajesControllerProvider.notifier).agregarCombustible(
        widget.viajeIdExterno,
        dto,
      );

      if (mounted) {
        MensajesGlobales.exito('Recarga registrada correctamente');
        Navigator.pop(context);
      }
    } catch (e) {
      MensajesGlobales.error('Error al registrar combustible: $e');
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }
}