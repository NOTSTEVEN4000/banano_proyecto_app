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
  String? _placaError;

  late final TextEditingController _placaController;
  late final TextEditingController _nombreController;
  late final TextEditingController _capacidadController;
  late final TextEditingController _marcaController;
  late final TextEditingController _modeloController;
  late final TextEditingController _anioController;
  late final TextEditingController _colorController;
  late final TextEditingController _kilometrajeController;

  String? _tipoSeleccionado;
  String? _estadoSeleccionado = 'Operativo';
  String? _conductorSeleccionado;

  final List<String> _tiposVehiculo = [
    'Particular', 'Camión', 'Furgoneta', 'Tractomula', 'Van',
    'Cabezal', 'Volqueta', 'Bus', 'Moto',
  ];

  final List<String> _estadosVehiculo = [
    'Operativo', 'En mantenimiento', 'Fuera de servicio',
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
    _kilometrajeController = TextEditingController(text: v?.kilometrajeActual?.toString() ?? '');

    _tipoSeleccionado = v?.tipo;
    _estadoSeleccionado = v?.estado ?? 'Operativo';
    _conductorSeleccionado = v?.conductorAsignadoNombre;

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

  Future<void> _validarPlacaEnTiempoReal() async {
    final placa = _placaController.text.trim().toUpperCase();
    if (placa.isEmpty) {
      setState(() => _placaError = null);
      return;
    }
    final errorFormato = Validadores.placaEcuatoriana(placa);
    if (errorFormato != null) {
      setState(() => _placaError = errorFormato);
      return;
    }
    if (placa.length >= 6) {
      await _comprobarDuplicado(placa);
    } else {
      setState(() => _placaError = null);
    }
  }

  Future<void> _comprobarDuplicado(String placa) async {
    final isar = ref.read(isarProvider);
    if (widget.editar != null && placa == widget.editar!.placa.toUpperCase()) {
      setState(() => _placaError = null);
      return;
    }
    final existente = await isar.vehiculoEntitys.filter().placaEqualTo(placa).findFirst();
    if (existente == null) {
      setState(() => _placaError = null);
      return;
    }
    setState(() {
      _placaError = existente.activo
          ? 'Esta placa ya está registrada en un vehículo activo'
          : 'Esta placa está pendiente de sincronizar o inactiva';
    });
  }

  Future<void> _seleccionarConductor() async {
    final colorScheme = Theme.of(context).colorScheme;
    final seleccionado = await showModalBottomSheet<Map<String, String>?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        expand: false,
        builder: (_, controller) => Column(
          children: [
            const SizedBox(height: 12),
            Container(height: 4, width: 40, decoration: BoxDecoration(color: colorScheme.outlineVariant, borderRadius: BorderRadius.circular(10))),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Seleccionar Conductor', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: _conductores.length,
                itemBuilder: (_, i) {
                  final c = _conductores[i];
                  final esSeleccionado = _conductorSeleccionado == c['nombre'];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: esSeleccionado ? colorScheme.primary : colorScheme.surfaceVariant,
                      child: Icon(Icons.person, color: esSeleccionado ? colorScheme.onPrimary : colorScheme.onSurfaceVariant),
                    ),
                    title: Text(c['nombre']!, style: TextStyle(fontWeight: esSeleccionado ? FontWeight.bold : FontWeight.normal)),
                    trailing: esSeleccionado ? Icon(Icons.check_circle, color: colorScheme.primary) : null,
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
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final editando = widget.editar != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(editando ? 'Editar Vehículo' : 'Nuevo Vehículo'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _seccionTarjeta('Información Principal', colorScheme, isDark, [
              _campoTexto(_nombreController, 'Nombre del vehículo *', Icons.badge_outlined, colorScheme, isDark, validator: Validadores.requerido),
              const SizedBox(height: 16),
              _campoTexto(
                _placaController,
                'Placa *',
                Icons.confirmation_number_outlined,
                colorScheme,
                isDark,
                helperText: 'Ej: ABC-123, ABC-1234',
                errorText: _placaError,
                inputFormatters: [Formateadores.placaEcuatoriana()],
                validator: (v) {
                  final error = Validadores.placaEcuatoriana(v);
                  if (error != null) return error;
                  if (_placaError != null) return _placaError;
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _tipoSeleccionado,
                decoration: _decoracionCampo('Tipo de vehículo *', Icons.category_outlined, colorScheme, isDark),
                dropdownColor: isDark ? colorScheme.surfaceContainerHigh : Colors.white,
                items: _tiposVehiculo.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                validator: Validadores.requerido,
                onChanged: (v) => setState(() => _tipoSeleccionado = v),
              ),
            ]),
            const SizedBox(height: 24),
            _seccionTarjeta('Detalles del Vehículo', colorScheme, isDark, [
              Row(
                children: [
                  Expanded(child: _campoTexto(_marcaController, 'Marca *', Icons.branding_watermark_outlined, colorScheme, isDark, validator: Validadores.requerido)),
                  const SizedBox(width: 16),
                  Expanded(child: _campoTexto(_modeloController, 'Modelo *', Icons.directions_car_outlined, colorScheme, isDark, validator: Validadores.requerido)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _campoTexto(_capacidadController, 'Capacidad (cajas)', Icons.inventory_2_outlined, colorScheme, isDark, keyboard: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], validator: Validadores.numeroPositivo)),
                  const SizedBox(width: 16),
                  Expanded(child: _campoTexto(_kilometrajeController, 'Kilometraje actual', Icons.speed_outlined, colorScheme, isDark, keyboard: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], validator: Validadores.numeroPositivo)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(flex: 2, child: _campoTexto(_anioController, 'Año', Icons.calendar_today_outlined, colorScheme, isDark, keyboard: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly], validator: Validadores.anioVehiculo)),
                  const SizedBox(width: 16),
                  Expanded(flex: 3, child: _campoTexto(_colorController, 'Color (opcional)', Icons.color_lens_outlined, colorScheme, isDark)),
                ],
              ),
            ]),
            const SizedBox(height: 24),
            _seccionTarjeta('Estado y Asignación', colorScheme, isDark, [
              DropdownButtonFormField<String>(
                value: _estadoSeleccionado,
                decoration: _decoracionCampo('Estado del vehículo *', Icons.info_outline, colorScheme, isDark),
                dropdownColor: isDark ? colorScheme.surfaceContainerHigh : Colors.white,
                items: _estadosVehiculo.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                validator: Validadores.requerido,
                onChanged: (v) => setState(() => _estadoSeleccionado = v),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: _seleccionarConductor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colorScheme.outlineVariant),
                    color: isDark ? colorScheme.surface : colorScheme.grey50,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person_outline, color: colorScheme.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _conductorSeleccionado ?? 'Seleccionar conductor (opcional)',
                          style: TextStyle(fontSize: 15, color: _conductorSeleccionado == null ? colorScheme.outline : colorScheme.onSurface),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 14, color: colorScheme.outline),
                    ],
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 40),
            FilledButton.icon(
              onPressed: _guardarVehiculo,
              icon: Icon(editando ? Icons.save : Icons.add_circle),
              label: Text(editando ? 'Guardar Cambios' : 'Crear Vehículo', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ==================== WIDGETS HELPERS OPTIMIZADOS ====================

  Widget _seccionTarjeta(String titulo, ColorScheme colorScheme, bool isDark, List<Widget> contenido) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(titulo, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorScheme.primary, letterSpacing: 1)),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDark ? colorScheme.surfaceContainer : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(isDark ? 0.2 : 0.05), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(children: contenido),
        ),
      ],
    );
  }

  InputDecoration _decoracionCampo(String label, IconData icon, ColorScheme colorScheme, bool isDark) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 22),
      filled: true,
      fillColor: isDark ? colorScheme.surface : colorScheme.grey50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: colorScheme.outlineVariant)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: colorScheme.outlineVariant)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: colorScheme.primary, width: 2)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: colorScheme.error)),
    );
  }

  Widget _campoTexto(TextEditingController controller, String label, IconData icon, ColorScheme colorScheme, bool isDark, {TextInputType? keyboard, List<TextInputFormatter>? inputFormatters, String? helperText, String? errorText, String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      inputFormatters: inputFormatters,
      textCapitalization: TextCapitalization.words,
      style: const TextStyle(fontSize: 15),
      decoration: _decoracionCampo(label, icon, colorScheme, isDark).copyWith(helperText: helperText, errorText: errorText),
      validator: validator,
    );
  }

  Future<void> _guardarVehiculo() async {
    // 1. Validar el formulario
    if (!_formKey.currentState!.validate()) {
      MensajesGlobales.advertenciaCampos('Completa todos los campos correctamente');
      return;
    }

    // 2. Validar que no haya errores de placa (duplicados)
    if (_placaError != null) {
      MensajesGlobales.error(_placaError!);
      return;
    }

    // 3. Extraer y parsear datos
    final placa = _placaController.text.trim().toUpperCase();
    final nombre = _nombreController.text.trim();
    final capacidad = int.tryParse(_capacidadController.text.trim()) ?? 0;
    final marca = _marcaController.text.trim();
    final modelo = _modeloController.text.trim();
    final anio = int.tryParse(_anioController.text.trim());
    final color = _colorController.text.trim().isEmpty ? null : _colorController.text.trim();
    final kilometraje = int.tryParse(_kilometrajeController.text.trim()) ?? 0;

    try {
      // Mostrar indicador de carga si es necesario
      if (widget.editar != null) {
        // MODO EDICIÓN
        await ref.read(vehiculosControllerProvider.notifier).editar(
              widget.editar!.idExterno, // Usamos el ID del vehículo que estamos editando
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
              null, // conductorId si lo tuvieras
              _conductorSeleccionado,
            );
        MensajesGlobales.exito('Vehículo actualizado correctamente');
      } else {
        // MODO CREACIÓN
        await ref.read(vehiculosControllerProvider.notifier).crear(
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
        MensajesGlobales.exito('Vehículo creado con éxito');
      }

      // 4. Regresar a la pantalla anterior indicando éxito
      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      MensajesGlobales.error('Error al procesar la solicitud: $e');
    }
  }
}

// Extensión simple para colores consistentes
extension ColorSchemeExt on ColorScheme {
  Color get grey50 => const Color(0xFFF9FAFB);
}