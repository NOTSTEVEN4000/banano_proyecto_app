import 'package:banano_proyecto_app/features/viajes/data/models/crear_viaje_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';

class CrearViajePage extends ConsumerStatefulWidget {
  const CrearViajePage({super.key});

  @override
  ConsumerState<CrearViajePage> createState() => _CrearViajePageState();
}

class _CrearViajePageState extends ConsumerState<CrearViajePage> {
  final _formKey = GlobalKey<FormState>();
  bool _estaCargando = false;

  String? _tipoViaje = 'INSUMOS';
  String? _vehiculoSeleccionado;
  String? _haciendaSeleccionada;
  String? _clienteSeleccionado;
  String? _descripcionDestino;

  @override
  Widget build(BuildContext context) {
    final vehiculosAsync = ref.watch(vehiculosControllerProvider);
    final viajesAsync = ref.watch(viajesControllerProvider);
    final haciendasAsync = ref.watch(proveedoresControllerProvider);
    final clientesAsync = ref.watch(clientesControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Viaje'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            _buildSectionTitle('Configuración del Viaje', Icons.settings),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _tipoViaje,
              decoration: const InputDecoration(
                labelText: 'Tipo de Viaje *',
                prefixIcon: Icon(Icons.swap_calls),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'INSUMOS',
                  child: Text('Entrega de Insumos'),
                ),
                DropdownMenuItem(
                  value: 'CAJAS',
                  child: Text('Recolección de Cajas'),
                ),
              ],
              onChanged: (value) => setState(() {
                _tipoViaje = value;
                _haciendaSeleccionada = null;
                _clienteSeleccionado = null;
              }),
            ),
            const SizedBox(height: 20),
            vehiculosAsync.when(
              data: (vehiculos) {
                final activos = vehiculos.where((v) => v.activo == true).toList();
                final idsOcupados = viajesAsync.maybeWhen(
                  data: (viajes) => viajes
                      .where((v) =>
                          v.estado == EstadoViaje.CREADO ||
                          v.estado == EstadoViaje.EN_RUTA)
                      .map((v) => v.vehiculoIdExterno)
                      .toSet(),
                  orElse: () => <String>{},
                );

                return DropdownButtonFormField<String>(
                  value: _vehiculoSeleccionado,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Vehículo Disponible *',
                    prefixIcon: Icon(Icons.local_shipping),
                    border: OutlineInputBorder(),
                  ),
                  items: activos.map((v) {
  final ocupado = idsOcupados.contains(v.idExterno);
  return DropdownMenuItem<String>(
    value: v.idExterno,
    enabled: !ocupado,
    child: Text(
      '${v.marca} ${v.modelo} (${v.placa})${ocupado ? " - EN RUTA" : ""}',
      style: TextStyle(
        // Cambia Colors.black87 por Theme.of(context).textTheme.bodyLarge?.color
        // O usa condicionales para manejar el gris si está ocupado:
        color: ocupado 
            ? Colors.grey 
            : Theme.of(context).brightness == Brightness.dark 
                ? Colors.white 
                : Colors.black87,
      ),
    ),
  );
}).toList(),
                  onChanged: (val) =>
                      setState(() => _vehiculoSeleccionado = val),
                  validator: (v) => v == null ? 'Selecciona un vehículo' : null,
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, __) =>
                  Text('Error: $e', style: const TextStyle(color: Colors.red)),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Ubicación y Destino', Icons.location_on),
            const SizedBox(height: 16),
            haciendasAsync.when(
              data: (destinos) {
                final activos = destinos.where((d) => d.activo == true).toList();
                return DropdownButtonFormField<String>(
                  value: _haciendaSeleccionada,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Hacienda / Proveedor *',
                    prefixIcon: Icon(Icons.agriculture),
                    border: OutlineInputBorder(),
                  ),
                  items: activos
                      .map((d) => DropdownMenuItem(
                            value: d.idExterno,
                            child: Text(d.nombre),
                          ))
                      .toList(),
                  onChanged: (val) =>
                      setState(() => _haciendaSeleccionada = val),
                  validator: (v) => v == null ? 'Selecciona el destino' : null,
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, __) => Text('Error: $e'),
            ),
            const SizedBox(height: 20),
            if (_tipoViaje == 'CAJAS') ...[
              clientesAsync.when(
                data: (clientes) {
                  final activos = clientes.where((c) => c.activo == true).toList();
                  return DropdownButtonFormField<String>(
                    value: _clienteSeleccionado,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Cliente Final (Opcional)',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    items: activos
                        .map((c) => DropdownMenuItem(
                              value: c.idExterno,
                              child: Text(c.nombre),
                            ))
                        .toList(),
                    onChanged: (val) =>
                        setState(() => _clienteSeleccionado = val),
                  );
                },
                loading: () => const SizedBox(
                  height: 50,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (_, __) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 20),
            ],
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Notas adicionales',
                prefixIcon: Icon(Icons.note_add),
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              onChanged: (val) => _descripcionDestino = val,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: FilledButton(
                onPressed: _estaCargando ? null : _procesarRegistro,
                child: _estaCargando
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('CREAR VIAJE'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.blueGrey),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        const Expanded(child: Divider(indent: 12)),
      ],
    );
  }

  Future<void> _procesarRegistro() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _estaCargando = true);
    try {
      final dto = CrearViajeDto(
        fecha: DateTime.now().toIso8601String().split('T')[0],
        tipo: _tipoViaje!,
        vehiculoIdExterno: _vehiculoSeleccionado!,
        destino: {
          'tipoDestino': _tipoViaje == 'CAJAS' ? 'CLIENTE' : 'HACIENDA',
          'haciendaIdExterno': _haciendaSeleccionada,
          'clienteIdExterno': _clienteSeleccionado,
          'descripcion': _descripcionDestino,
        },
        notas: _descripcionDestino,
      );

      await ref.read(viajesControllerProvider.notifier).crear(dto);
      if (mounted) {
        MensajesGlobales.exito('Viaje creado');
        context.pop();
      }
    } catch (e) {
      MensajesGlobales.error('Error: $e');
    } finally {
      if (mounted) setState(() => _estaCargando = false);
    }
  }
}