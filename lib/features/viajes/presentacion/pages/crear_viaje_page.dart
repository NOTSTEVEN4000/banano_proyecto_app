import 'package:banano_proyecto_app/core/ui/widgets/botones.dart'; // Asegúrate de importar tus widgets
import 'package:banano_proyecto_app/core/ui/widgets/campos_formulario.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/crear_viaje_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/core/utils/validadores.dart';

class CrearViajePage extends ConsumerStatefulWidget {
  const CrearViajePage({super.key});

  @override
  ConsumerState<CrearViajePage> createState() => _CrearViajePageState();
}

class _CrearViajePageState extends ConsumerState<CrearViajePage> {
  final _formKey = GlobalKey<FormState>();
  final _notasController = TextEditingController(); // Usar controlador para consistencia
  bool _estaCargando = false;

  String? _tipoViaje = 'INSUMOS';
  String? _vehiculoSeleccionado;
  String? _haciendaSeleccionada;
  String? _clienteSeleccionado;

  @override
  void dispose() {
    _notasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final vehiculosAsync = ref.watch(vehiculosControllerProvider);
    final viajesAsync = ref.watch(viajesControllerProvider);
    final haciendasAsync = ref.watch(proveedoresControllerProvider);
    final clientesAsync = ref.watch(clientesControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Viaje'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            subtituloSeccion('Configuración del Viaje'),
            _construirDropdown(
              label: 'Tipo de Viaje *',
              icon: Icons.swap_calls,
              value: _tipoViaje,
              items: const {
                'INSUMOS': 'Entrega de Insumos',
                'CAJAS': 'Recolección de Cajas',
              },
              onChanged: (value) => setState(() {
                _tipoViaje = value;
                _haciendaSeleccionada = null;
                _clienteSeleccionado = null;
              }),
              colorScheme: colorScheme,
              isDark: isDark,
            ),
            
            const SizedBox(height: 16),
            
            // Selector de Vehículo con lógica de disponibilidad
            vehiculosAsync.when(
              data: (vehiculos) {
                final activos = vehiculos.where((v) => v.activo == true).toList();
                final idsOcupados = viajesAsync.maybeWhen(
                  data: (viajes) => viajes
                      .where((v) => v.estado == EstadoViaje.CREADO || v.estado == EstadoViaje.EN_RUTA)
                      .map((v) => v.vehiculoIdExterno)
                      .toSet(),
                  orElse: () => <String>{},
                );

                return _construirDropdown(
                  label: 'Vehículo Disponible *',
                  icon: Icons.local_shipping_outlined,
                  value: _vehiculoSeleccionado,
                  items: {
                    for (var v in activos)
                      v.idExterno: '${v.marca} ${v.modelo} (${v.placa})${idsOcupados.contains(v.idExterno) ? " - EN RUTA" : ""}'
                  },
                  onChanged: (val) => setState(() => _vehiculoSeleccionado = val),
                  colorScheme: colorScheme,
                  isDark: isDark,
                  disabledItems: idsOcupados, // Necesitarás ajustar el helper si quieres deshabilitar visualmente
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, __) => Text('Error al cargar vehículos: $e', style: const TextStyle(color: Colors.red)),
            ),

            const SizedBox(height: 32),
            subtituloSeccion('Ubicación y Destino'),
            
            // Selector de Hacienda/Proveedor
            haciendasAsync.when(
              data: (destinos) {
                final activos = destinos.where((d) => d.activo == true).toList();
                return _construirDropdown(
                  label: 'Hacienda / Proveedor *',
                  icon: Icons.agriculture_outlined,
                  value: _haciendaSeleccionada,
                  items: {for (var d in activos) d.idExterno: d.nombre},
                  onChanged: (val) => setState(() => _haciendaSeleccionada = val),
                  colorScheme: colorScheme,
                  isDark: isDark,
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, __) => const Text('Error al cargar haciendas'),
            ),

            if (_tipoViaje == 'CAJAS') ...[
              const SizedBox(height: 16),
              clientesAsync.when(
                data: (clientes) {
                  final activos = clientes.where((c) => c.activo == true).toList();
                  return _construirDropdown(
                    label: 'Cliente Final',
                    icon: Icons.person_pin_circle_outlined,
                    value: _clienteSeleccionado,
                    items: {for (var c in activos) c.idExterno: c.nombre},
                    onChanged: (val) => setState(() => _clienteSeleccionado = val),
                    colorScheme: colorScheme,
                    isDark: isDark,
                    required: true,
                  );
                },
                loading: () => const LinearProgressIndicator(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ],

            const SizedBox(height: 32),
            subtituloSeccion('Información Adicional'),
            componenteCampoTexto(
              controlador: _notasController,
              etiqueta: 'Notas del viaje / Destino',
              icono: Icons.note_add_outlined,
              maxLines: 3,
            ),

            const SizedBox(height: 48),
            botonPrincipal(
              etiqueta: 'CREAR VIAJE',
              icono: Icons.map_outlined,
              alPresionar: _estaCargando ? null : _procesarRegistro,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper para mantener el estilo visual de los Dropdowns igual a Proveedores
  Widget _construirDropdown({
    required String label,
    required IconData icon,
    required String? value,
    required Map<String, String> items,
    required void Function(String?) onChanged,
    required ColorScheme colorScheme,
    required bool isDark,
    bool required = true,
    Set<String>? disabledItems,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: colorScheme.primary),
        filled: true,
        fillColor: isDark ? colorScheme.surfaceContainer : Colors.grey.shade50,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.5)),
        ),
      ),
      items: items.entries.map((e) {
        final isDisabled = disabledItems?.contains(e.key) ?? false;
        return DropdownMenuItem(
          value: e.key,
          enabled: !isDisabled,
          child: Text(
            e.value,
            style: TextStyle(
              color: isDisabled ? Colors.grey : (isDark ? Colors.white : Colors.black87),
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      validator: required ? Validadores.requerido : null,
    );
  }

  Future<void> _procesarRegistro() async {
    if (!_formKey.currentState!.validate()) {
      MensajesGlobales.advertenciaCampos('Completa los campos obligatorios');
      return;
    }

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
          'descripcion': _notasController.text.trim(),
        },
        notas: _notasController.text.trim(),
      );

      await ref.read(viajesControllerProvider.notifier).crear(dto);
      if (mounted) {
        MensajesGlobales.exito('¡Viaje creado con éxito!');
        context.pop();
      }
    } catch (e) {
      MensajesGlobales.error('Error al crear el viaje: $e');
    } finally {
      if (mounted) setState(() => _estaCargando = false);
    }
  }
}