import 'package:banano_proyecto_app/core/utils/formateadores.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/core/utils/validadores.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../data/models/vehiculo_entity.dart';

class NuevoVehiculoPage extends ConsumerStatefulWidget {
  final VehiculoEntity? editar;
  const NuevoVehiculoPage({super.key, this.editar});

  @override
  ConsumerState<NuevoVehiculoPage> createState() => _NuevoVehiculoPageState();
}

class _NuevoVehiculoPageState extends ConsumerState<NuevoVehiculoPage> {
  final _formKey = GlobalKey<FormState>();
  String? _placaError; // Para errores de duplicado o formato

  // Controladores
  late final TextEditingController _placaController;
  late final TextEditingController _nombreController;
  late final TextEditingController _capacidadController;
  late final TextEditingController _marcaController;
  late final TextEditingController _modeloController;
  late final TextEditingController _anioController;
  late final TextEditingController _colorController;
  late final TextEditingController _kilometrajeController;

  // Valores seleccionados
  String? _tipoSeleccionado;
  String? _estadoSeleccionado = 'Operativo';
  String? _conductorSeleccionado;

  // Listas
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

  final List<Map<String, String>> _conductores = [
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
    _placaController = TextEditingController(text: v?.placa ?? '');
    _nombreController = TextEditingController(text: v?.nombre ?? '');
    _capacidadController = TextEditingController(text: v?.capacidadCajas?.toString() ?? '');
    _marcaController = TextEditingController(text: v?.marca ?? '');
    _modeloController = TextEditingController(text: v?.modelo ?? '');
    _anioController = TextEditingController(text: v?.anio?.toString() ?? '');
    _colorController = TextEditingController(text: v?.color ?? '');
    _kilometrajeController = TextEditingController(
      text: v?.kilometrajeActual?.toString() ?? '');
    _tipoSeleccionado = v?.tipo;
    _estadoSeleccionado = v?.estado ?? 'Operativo';
    _conductorSeleccionado = v?.conductorAsignadoNombre;
    // Validar placa en tiempo real
    _placaController.addListener(_validarPlacaEnTiempoReal);
  }

  @override
  void dispose() {
    _placaController.removeListener(_validarPlacaEnTiempoReal);
    _placaController.dispose();
    _nombreController.dispose();
    _capacidadController.dispose();
    _marcaController.dispose();
    _modeloController.dispose();
    _anioController.dispose();
    _colorController.dispose();
    _kilometrajeController.dispose();
    super.dispose();
  }

  // Validación en tiempo real (formato + duplicado)
  Future<void> _validarPlacaEnTiempoReal() async {
    final placa = _placaController.text.trim().toUpperCase();

    // Validar formato primero
    final errorFormato = Validadores.placaEcuatoriana(placa);
    if (errorFormato != null) {
      setState(() => _placaError = errorFormato);
      return;
    }

    // Si formato OK y longitud suficiente → comprobar duplicado
    if (placa.length >= 6) {
      await _comprobarDuplicado(placa);
    } else {
      setState(() => _placaError = null);
    }
  }

  // Comprobador de duplicados (reutilizable)
  Future<void> _comprobarDuplicado(String placa) async {
    final isar = ref.read(isarProvider);

    // Si estamos editando y no cambió la placa → OK
    if (widget.editar != null && placa == widget.editar!.placa.toUpperCase()) {
      setState(() => _placaError = null);
      return;
    }

    final existente = await isar.vehiculoEntitys
        .filter()
        .placaEqualTo(placa)
        .findFirst();

    if (existente == null) {
      setState(() => _placaError = null);
      return;
    }

    if (existente.activo) {
      setState(
        () =>
            _placaError = 'Esta placa ya está registrada en un vehículo activo',
      );
    } else if (existente.pendienteSync) {
      setState(() => _placaError = 'Esta placa está pendiente de sincronizar');
    } else {
      setState(() => _placaError = 'Placa inactiva. Contacte al administrador');
    }
  }

  Future<void> _seleccionarConductor() async {
    final seleccionado = await showModalBottomSheet<Map<String, String>?>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (_, controller) => Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Seleccionar Conductor',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: _conductores.length,
                itemBuilder: (_, i) {
                  final c = _conductores[i];
                  final seleccionado = _conductorSeleccionado == c['nombre'];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: seleccionado
                          ? Colors.green
                          : Colors.grey[200],
                      child: Icon(
                        Icons.person,
                        color: seleccionado ? Colors.white : Colors.black,
                      ),
                    ),
                    title: Text(c['nombre']!),
                    trailing: seleccionado
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () => Navigator.pop(context, c),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    if (seleccionado != null) {
      setState(() => _conductorSeleccionado = seleccionado['nombre']);
    }
  }

  @override
  Widget build(BuildContext context) {
    final editando = widget.editar != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(editando ? 'Editar Vehículo' : 'Nuevo Vehículo'),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Nombre
            TextFormField(
              controller: _nombreController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nombre del vehículo *',
                prefixIcon: Icon(Icons.badge_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                filled: true,
              ),
              validator: Validadores.requerido,
            ),
            const SizedBox(height: 20),

            // Placa con validación en tiempo real
            TextFormField(
              controller: _placaController,
              inputFormatters: [Formateadores.placaEcuatoriana()],
              decoration: InputDecoration(
                labelText: 'Placa *',
                prefixIcon: const Icon(Icons.confirmation_number_outlined),
                helperText: 'Ej: ABC-123, ABC-1234, AA-1234, AB-123A',
                errorText: _placaError,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                filled: true,
              ),
              validator: (v) {
                final error = Validadores.placaEcuatoriana(v);
                if (error != null) return error;
                if (_placaError != null) return _placaError;
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Tipo
            DropdownButtonFormField<String>(
              initialValue: _tipoSeleccionado,
              decoration: const InputDecoration(
                labelText: 'Tipo de vehículo *',
                prefixIcon: Icon(Icons.category_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                filled: true,
              ),
              items: _tiposVehiculo
                  .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                  .toList(),
              validator: Validadores.requerido,
              onChanged: (v) => setState(() => _tipoSeleccionado = v),
            ),
            const SizedBox(height: 20),

            // Marca y Modelo
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _marcaController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Marca *',
                      prefixIcon: Icon(Icons.branding_watermark_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      filled: true,
                    ),
                    validator: Validadores.requerido,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _modeloController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Modelo *',
                      prefixIcon: Icon(Icons.directions_car_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      filled: true,
                    ),
                    validator: Validadores.requerido,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Año y Color
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _anioController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Año',
                      prefixIcon: Icon(Icons.calendar_today_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      filled: true,
                    ),
                    validator: Validadores.anioVehiculo,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _colorController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Color (opcional)',
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Capacidad y Kilometraje
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _capacidadController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Capacidad (cajas)',
                      prefixIcon: Icon(Icons.inventory_2_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      filled: true,
                    ),
                    validator: Validadores.numeroPositivo,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _kilometrajeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Kilometraje',
                      prefixIcon: Icon(Icons.speed_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      filled: true,
                    ),
                    validator: Validadores.numeroPositivo,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Estado
            DropdownButtonFormField<String>(
              initialValue: _estadoSeleccionado,
              decoration: const InputDecoration(
                labelText: 'Estado *',
                prefixIcon: Icon(Icons.info_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                filled: true,
              ),
              items: _estadosVehiculo
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              validator: Validadores.requerido,
              onChanged: (v) => setState(() => _estadoSeleccionado = v),
            ),
            const SizedBox(height: 20),

            // Conductor
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey[300]!),
              ),
              leading: const Icon(Icons.person_outline),
              title: Text(
                _conductorSeleccionado ?? 'Seleccionar conductor (opcional)',
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: _seleccionarConductor,
            ),
            const SizedBox(height: 40),

            // Botón Guardar
            FilledButton.icon(
              onPressed: _guardarVehiculo,
              icon: Icon(editando ? Icons.save : Icons.add_circle),
              label: Text(
                editando ? 'Guardar Cambios' : 'Crear Vehículo',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _guardarVehiculo() async {
    if (!_formKey.currentState!.validate()) {
      MensajesGlobales.advertenciaCampos(
        'Completa todos los campos correctamente',
      );
      return;
    }

    if (_tipoSeleccionado == null || _estadoSeleccionado == null) {
      MensajesGlobales.advertencia('Selecciona tipo y estado del vehículo');
      return;
    }

    final placa = _placaController.text.trim().toUpperCase();
    final nombre = _nombreController.text.trim();
    final capacidad = int.tryParse(_capacidadController.text.trim());
    final marca = _marcaController.text.trim();
    final modelo = _modeloController.text.trim();
    final anio = int.tryParse(_anioController.text.trim());
    final color = _colorController.text.trim().isEmpty
        ? null
        : _colorController.text.trim();
    final kilometraje = int.tryParse(_kilometrajeController.text.trim());

    try {
      if (widget.editar != null) {
        await ref
            .read(vehiculosControllerProvider.notifier)
            .editar(
              widget.editar!.idExterno,
              placa,
              nombre,
              capacidad,
              _tipoSeleccionado!,
              marca,
              modelo,
              anio,
              color,
              kilometraje,
              _estadoSeleccionado!,
              null,
              _conductorSeleccionado,
            );
        MensajesGlobales.exito('Vehículo actualizado');
      } else {
        await ref
            .read(vehiculosControllerProvider.notifier)
            .crear(
              placa,
              nombre,
              capacidad,
              _tipoSeleccionado!,
              marca,
              modelo,
              anio,
              color,
              kilometraje,
              _estadoSeleccionado!,
              null,
              _conductorSeleccionado,
            );
        MensajesGlobales.exito('Vehículo creado');
      }

      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      MensajesGlobales.error('Error al guardar: $e');
    }
  }
}
