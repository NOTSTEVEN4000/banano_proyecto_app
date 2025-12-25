import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../data/models/vehiculo_entity.dart';

class NuevoVehiculoPage extends ConsumerStatefulWidget {
  final VehiculoEntity? editar;
  const NuevoVehiculoPage({super.key, this.editar});

  @override
  ConsumerState<NuevoVehiculoPage> createState() => _NuevoVehiculoPageState();
}

class _NuevoVehiculoPageState extends ConsumerState<NuevoVehiculoPage> {
  final _form = GlobalKey<FormState>();

  // Controladores
  late final TextEditingController _placa;
  late final TextEditingController _nombre;
  late final TextEditingController _capacidad;
  late final TextEditingController _marca;
  late final TextEditingController _modelo;
  late final TextEditingController _anio;
  late final TextEditingController _color;
  late final TextEditingController _kilometraje;

  // Valores seleccionados
  String? _tipoSeleccionado;
  String? _estadoSeleccionado;
  String? _conductorSeleccionado;

  String? _placaError;

  // Listas predefinidas
  final List<String> _tiposVehiculo = [
    'Particular',
    'Camión',
    'Furgoneta',
    'Tractomula',
    'Van',
    'Cabezal',
    'Volqueta',
    'Bus',
    'Moto',
  ];

  final List<String> _estadosVehiculo = [
    'Operativo',
    'En mantenimiento',
    'Fuera de servicio',
  ];

  // Simulación de conductores (cámbiala por tu lista real)
  final List<Map<String, String>> _conductoresDisponibles = [
    {'id': '1', 'nombre': 'Juan Pérez'},
    {'id': '2', 'nombre': 'María González'},
    {'id': '3', 'nombre': 'Carlos Ramírez'},
    {'id': '4', 'nombre': 'Ana López'},
    {'id': '5', 'nombre': 'Luis Martínez'},
  ];

  @override
  void initState() {
    super.initState();
    final v = widget.editar;

    _placa = TextEditingController(text: v?.placa ?? '');
    _nombre = TextEditingController(text: v?.nombre ?? '');
    _capacidad = TextEditingController(text: v?.capacidadCajas?.toString() ?? '');
    _marca = TextEditingController(text: v?.marca ?? '');
    _modelo = TextEditingController(text: v?.modelo ?? '');
    _anio = TextEditingController(text: v?.anio?.toString() ?? '');
    _color = TextEditingController(text: v?.color ?? '');
    _kilometraje = TextEditingController(text: v?.kilometrajeActual?.toString() ?? '');

    _tipoSeleccionado = v?.tipo;
    _estadoSeleccionado = v?.estado ?? 'Operativo';
    _conductorSeleccionado = v?.conductorAsignadoNombre;

    if (v?.placa.isNotEmpty == true) {
      _formatearPlaca();
    }

    _placa.addListener(() {
      _formatearPlaca();
      _validarPlacaDuplicada();
    });
  }

  @override
  void dispose() {
    _placa.dispose();
    _nombre.dispose();
    _capacidad.dispose();
    _marca.dispose();
    _modelo.dispose();
    _anio.dispose();
    _color.dispose();
    _kilometraje.dispose();
    super.dispose();
  }

  void _formatearPlaca() {
    final texto = _placa.text.replaceAll('-', '');
    final letras = texto.replaceAll(RegExp(r'[^A-Z]'), '').toUpperCase();
    final numeros = texto.replaceAll(RegExp(r'[^0-9]'), '');

    String formateado = letras;
    if (numeros.isNotEmpty) formateado += '-$numeros';

    if (letras.length > 3) {
      formateado = letras.substring(0, 3) + (numeros.isNotEmpty ? '-$numeros' : '');
    }
    if (numeros.length > 4) {
      final nums = numeros.substring(0, 4);
      formateado = letras.substring(0, 3) + '-$nums';
    }

    _placa.value = _placa.value.copyWith(
      text: formateado,
      selection: TextSelection.collapsed(offset: formateado.length),
    );
  }

  Future<void> _validarPlacaDuplicada() async {
  final textoLimpio = _placa.text.replaceAll('-', '');
  if (textoLimpio.length < 6) {
    setState(() => _placaError = null);
    return;
  }

  final regex = RegExp(r'^[A-Z]{3}-?\d{3,4}$', caseSensitive: false);
  final placaActual = _placa.text.trim().toUpperCase();

  if (!regex.hasMatch(placaActual)) {
    setState(() => _placaError = 'Formato inválido. Ej: ABC-123 o ABC-1234');
    return;
  }

  // Si estamos editando y la placa no cambió → OK
  if (widget.editar != null && placaActual == widget.editar!.placa.toUpperCase()) {
    setState(() => _placaError = null);
    return;
  }

  final isar = ref.read(isarProvider);

  // Buscar cualquier vehículo con esa placa
  final vehiculoExistente = await isar.vehiculoEntitys
      .filter()
      .placaEqualTo(placaActual)
      .findFirst();

  if (vehiculoExistente == null) {
    setState(() => _placaError = null);
    return;
  }

  // Ahora analizamos el estado del vehículo encontrado
  if (vehiculoExistente.activo) {
    setState(() {
      _placaError = 'Esta placa ya está registrada en un vehículo activo.';
    });
  } else if (vehiculoExistente.pendienteSync) {
    setState(() {
      _placaError = 'Esta placa está pendiente de sincronizar. Espera a que se complete o elige otra placa.';
    });
  } else {
    // Inactivo (eliminado localmente)
    setState(() {
      _placaError = 'Esta placa existe pero está inactiva. Contacte al administrador para habilitarla.';
    });
  }
}

  Future<void> _seleccionarConductor() async {
    final seleccionado = await showModalBottomSheet<Map<String, String>?>(
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (_, controller) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Seleccionar Conductor',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: _conductoresDisponibles.length,
                itemBuilder: (_, i) {
                  final conductor = _conductoresDisponibles[i];
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(conductor['nombre']!),
                    trailing: _conductorSeleccionado == conductor['nombre']
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () => Navigator.pop(context, conductor),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: () => Navigator.pop(context, null),
                child: const Text('Cancelar'),
              ),
            ),
          ],
        ),
      ),
    );

    if (seleccionado != null) {
      setState(() {
        _conductorSeleccionado = seleccionado['nombre'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final editando = widget.editar != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(editando ? 'Editar Vehículo' : 'Nuevo Vehículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              // Nombre *
              TextFormField(
                controller: _nombre,
                decoration: const InputDecoration(
                  labelText: 'Nombre del vehículo *',
                  prefixIcon: Icon(Icons.badge),
                ),
                validator: (v) => v?.trim().isEmpty ?? true ? 'Requerido' : null,
              ),
              const SizedBox(height: 16),

              // Placa *
              TextFormField(
                controller: _placa,
                decoration: InputDecoration(
                  labelText: 'Placa *',
                  prefixIcon: const Icon(Icons.confirmation_number),
                  errorText: _placaError,
                  helperText: 'Formato: ABC-123 o ABC-1234',
                ),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9-]'))],
                validator: (v) {
                  if (v?.trim().isEmpty ?? true) return 'Requerido';
                  if (_placaError != null) return _placaError;
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Capacidad
              TextFormField(
                controller: _capacidad,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Capacidad de cajas',
                  prefixIcon: Icon(Icons.inventory_2),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 16),
              // Tipo * 
              DropdownButtonFormField<String>(
                initialValue: _tipoSeleccionado,
                hint: const Text('Selecciona un tipo'),
                decoration: const InputDecoration(
                  labelText: 'Tipo de vehículo *',
                  prefixIcon: Icon(Icons.category),
                ),
                items: _tiposVehiculo.map((tipo) {
                  return DropdownMenuItem(value: tipo, child: Text(tipo));
                }).toList(),
                validator: (v) => v == null ? 'Selecciona un tipo' : null,
                onChanged: (value) => setState(() => _tipoSeleccionado = value),
              ),
              const SizedBox(height: 16),

              // Marca *
              TextFormField(
                controller: _marca,
                decoration: const InputDecoration(
                  labelText: 'Marca *',
                  prefixIcon: Icon(Icons.branding_watermark),
                ),
                validator: (v) => v?.trim().isEmpty ?? true ? 'Requerido' : null,
              ),
              const SizedBox(height: 16),

              // Modelo *
              TextFormField(
                controller: _modelo,
                decoration: const InputDecoration(
                  labelText: 'Modelo *',
                  prefixIcon: Icon(Icons.directions_car),
                ),
                validator: (v) => v?.trim().isEmpty ?? true ? 'Requerido' : null,
              ),
              const SizedBox(height: 16),

              // Año
              TextFormField(
                controller: _anio,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Año',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) {
                  if (v?.isEmpty ?? true) return null;
                  final year = int.tryParse(v!);
                  if (year == null || year < 1900 || year > DateTime.now().year + 1) {
                    return 'Año inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Color
              TextFormField(
                controller: _color,
                decoration: const InputDecoration(
                  labelText: 'Color',
                  prefixIcon: Icon(Icons.color_lens),
                ),
              ),
              const SizedBox(height: 16),

              // Kilometraje
              TextFormField(
                controller: _kilometraje,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Kilometraje actual',
                  prefixIcon: Icon(Icons.speed),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) {
                  if (v?.isEmpty ?? true) return null;
                  final km = int.tryParse(v!);
                  if (km == null || km < 0) return 'Kilometraje inválido';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Estado *
              DropdownButtonFormField<String>(
                value: _estadoSeleccionado,
                hint: const Text('Selecciona un estado'),
                decoration: const InputDecoration(
                  labelText: 'Estado *',
                  prefixIcon: Icon(Icons.info_outline),
                ),
                items: _estadosVehiculo.map((estado) {
                  return DropdownMenuItem(value: estado, child: Text(estado));
                }).toList(),
                validator: (v) => v == null ? 'Selecciona un estado' : null,
                onChanged: (value) => setState(() => _estadoSeleccionado = value),
              ),
              const SizedBox(height: 16),

              // Conductor
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(_conductorSeleccionado ?? 'Seleccionar conductor (opcional)'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: _seleccionarConductor,
              ),
              const SizedBox(height: 32),

              // Botón Guardar
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () async {
                  // Validar formulario completo
                  if (!_form.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Completa todos los campos requeridos'), backgroundColor: Colors.orange),
                    );
                    return;
                  }

                  // Validaciones extra para dropdowns (por si acaso)
                  if (_tipoSeleccionado == null || _estadoSeleccionado == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Selecciona tipo y estado del vehículo'), backgroundColor: Colors.orange),
                    );
                    return;
                  }

                  final placa = _placa.text.trim().toUpperCase();
                  final nombre = _nombre.text.trim();
                  final capacidad = int.tryParse(_capacidad.text.trim());
                  final tipo = _tipoSeleccionado!;
                  final marca = _marca.text.trim();
                  final modelo = _modelo.text.trim();
                  final anio = int.tryParse(_anio.text.trim());
                  final color = _color.text.trim().isEmpty ? null : _color.text.trim();
                  final kilometraje = int.tryParse(_kilometraje.text.trim());
                  final estado = _estadoSeleccionado!;
                  final conductorNombre = _conductorSeleccionado;

                  try {
                    if (editando) {
                      await ref.read(vehiculosControllerProvider.notifier).editar(
                        widget.editar!.idExterno,
                        placa,
                        nombre,
                        capacidad,
                        tipo,
                        marca,
                        modelo,
                        anio,
                        color,
                        kilometraje,
                        estado,
                        null,
                        conductorNombre,
                      );
                    } else {
                      await ref.read(vehiculosControllerProvider.notifier).crear(
                        placa,
                        nombre,
                        capacidad,
                        tipo,
                        marca,
                        modelo,
                        anio,
                        color,
                        kilometraje,
                        estado,
                        null,
                        conductorNombre,
                      );
                    }

                    if (mounted) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(editando ? 'Vehículo actualizado' : 'Vehículo creado'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context, true);
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
                      );
                    }
                  }
                },
                child: Text(editando ? 'Guardar Cambios' : 'Crear Vehículo', style: const TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      
    );
  }
}

