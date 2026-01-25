import 'package:banano_proyecto_app/core/data/provincias_service.dart';
import 'package:banano_proyecto_app/core/ui/widgets/botones.dart';
import 'package:banano_proyecto_app/core/ui/widgets/campos_formulario.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/core/utils/validadores.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class NuevoProveedorPage extends ConsumerStatefulWidget {
  final ProveedorEntity? editar;
  const NuevoProveedorPage({super.key, this.editar});

  @override
  ConsumerState<NuevoProveedorPage> createState() => _NuevoProveedorPageState();
}

class _NuevoProveedorPageState extends ConsumerState<NuevoProveedorPage> {
  final _formKey = GlobalKey<FormState>();
  String? _rucError;

  late final TextEditingController _nombreController;
  late final TextEditingController _rucController;
  late final TextEditingController _contactoNombreController;
  late final TextEditingController _contactoTelefonoController;
  late final TextEditingController _contactoCorreoController;
  late final TextEditingController _direccionDetalleController;
  late final TextEditingController _precioController;
  late final TextEditingController _observacionesController;
  late final TextEditingController _diasCreditoController;

  String? _provinciaSeleccionada;
  String? _ciudadSeleccionada;
  String? _tipoSeleccionado;
  String? _formaPagoSeleccionada;
  List<Canton> _cantonesDisponibles = [];

  @override
  void initState() {
    super.initState();
    final p = widget.editar;
    _nombreController = TextEditingController(text: p?.nombre ?? '');
    _rucController = TextEditingController(text: p?.rucCi ?? '');
    _contactoNombreController = TextEditingController(text: p?.contactoNombre ?? '');
    _contactoTelefonoController = TextEditingController(text: p?.contactoTelefono ?? '');
    _contactoCorreoController = TextEditingController(text: p?.contactoCorreo ?? '');
    _direccionDetalleController = TextEditingController(text: p?.direccionDetalle ?? '');
    _precioController = TextEditingController(text: p?.precioActual.toString() ?? '');
    _observacionesController = TextEditingController(text: p?.observaciones ?? '');
    _diasCreditoController = TextEditingController(text: p?.diasCredito?.toString() ?? '');

    _tipoSeleccionado = p?.tipo;
    _formaPagoSeleccionada = p?.formaPago ?? 'CONTADO';

    if (p != null) {
      _provinciaSeleccionada = p.direccionProvincia;
      _ciudadSeleccionada = p.direccionCiudad;
    }

    _rucController.addListener(_validarRucEnTiempoReal);
  }

  @override
  void dispose() {
    _rucController.removeListener(_validarRucEnTiempoReal);
    _nombreController.dispose();
    _rucController.dispose();
    _contactoNombreController.dispose();
    _contactoTelefonoController.dispose();
    _contactoCorreoController.dispose();
    _direccionDetalleController.dispose();
    _precioController.dispose();
    _observacionesController.dispose();
    _diasCreditoController.dispose();
    super.dispose();
  }

  Future<void> _validarRucEnTiempoReal() async {
    final ruc = _rucController.text.trim();
    if (ruc.isEmpty) {
      setState(() => _rucError = null);
      return;
    }
    final errorFormato = Validadores.rucCiValido(ruc);
    if (errorFormato != null) {
      setState(() => _rucError = errorFormato);
      return;
    }
    await _comprobarRucDuplicado(ruc);
  }

  Future<void> _comprobarRucDuplicado(String ruc) async {
    final isar = ref.read(isarProvider);
    if (widget.editar != null && ruc == widget.editar!.rucCi?.trim()) {
      setState(() => _rucError = null);
      return;
    }
    final existente = await isar.proveedorEntitys.filter().rucCiEqualTo(ruc).findFirst();
    setState(() => _rucError = existente != null ? 'Este RUC/CI ya está registrado' : null);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final editando = widget.editar != null;
    final provinciasAsync = ref.watch(provinciasProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(editando ? 'Editar Proveedor' : 'Nuevo Proveedor'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            subtituloSeccion('Información Principal'),
            componenteCampoTexto(
              controlador: _nombreController,
              etiqueta: 'Nombre / Razón Social *',
              icono: Icons.business,
              funcionValidacion: Validadores.requerido,
            ),
            const SizedBox(height: 16),
            componenteCampoTexto(
              controlador: _rucController,
              etiqueta: 'RUC / CI *',
              icono: Icons.badge_outlined,
              tipoTeclado: TextInputType.number,
              formateadores: [FilteringTextInputFormatter.digitsOnly],
              textoError: _rucError,
              funcionValidacion: (v) => Validadores.rucCiValido(v) ?? _rucError,
            ),
            const SizedBox(height: 16),
            _construirDropdown(
              label: 'Tipo de Proveedor *',
              icon: Icons.category_outlined,
              value: _tipoSeleccionado,
              items: ['HACIENDA', 'OTRO'],
              onChanged: (v) => setState(() => _tipoSeleccionado = v),
              colorScheme: colorScheme,
              isDark: isDark,
            ),

            const SizedBox(height: 32),
            subtituloSeccion('Datos de Contacto'),
            componenteCampoTexto(
              controlador: _contactoNombreController,
              etiqueta: 'Nombre del contacto *',
              icono: Icons.person_outline,
              funcionValidacion: Validadores.requerido,
            ),
            const SizedBox(height: 16),
            componenteCampoTexto(
              controlador: _contactoTelefonoController,
              etiqueta: 'Teléfono *',
              icono: Icons.phone_android_outlined,
              tipoTeclado: TextInputType.phone,
              funcionValidacion: Validadores.telefonoEcuador,
            ),
            const SizedBox(height: 16),
            componenteCampoTexto(
              controlador: _contactoCorreoController,
              etiqueta: 'Correo',
              icono: Icons.email_outlined,
              tipoTeclado: TextInputType.emailAddress,
            ),

            const SizedBox(height: 32),
            subtituloSeccion('Ubicación'),
            _construirSelectoresUbicacion(provinciasAsync, colorScheme, isDark),
            const SizedBox(height: 16),
            componenteCampoTexto(
              controlador: _direccionDetalleController,
              etiqueta: 'Dirección detallada *',
              icono: Icons.directions_outlined,
              funcionValidacion: Validadores.direccionValida,
            ),

            const SizedBox(height: 32),
            subtituloSeccion('Condiciones Comerciales'),
            componenteCampoTexto(
              controlador: _precioController,
              etiqueta: 'Precio por caja *',
              icono: Icons.attach_money_outlined,
              tipoTeclado: const TextInputType.numberWithOptions(decimal: true),
              funcionValidacion: Validadores.precioValido,
            ),
            const SizedBox(height: 24),
            _construirDropdown(
              label: 'Forma de Pago *',
              icon: Icons.payments_outlined,
              value: _formaPagoSeleccionada,
              items: ['CONTADO', 'CREDITO', 'MIXTO'],
              onChanged: (v) => setState(() => _formaPagoSeleccionada = v),
              colorScheme: colorScheme,
              isDark: isDark,
            ),
            if (_formaPagoSeleccionada == 'CREDITO') ...[
              const SizedBox(height: 16),
              componenteCampoTexto(
                controlador: _diasCreditoController,
                etiqueta: 'Días de crédito',
                icono: Icons.calendar_month_outlined,
                tipoTeclado: TextInputType.number,
              ),
            ],

            const SizedBox(height: 32),
            subtituloSeccion('Adicional'),
            componenteCampoTexto(
              controlador: _observacionesController,
              etiqueta: 'Observaciones',
              icono: Icons.note_alt_outlined,
              maxLines: 3,
            ),

            const SizedBox(height: 48),
            botonPrincipal(
              etiqueta: editando ? 'Guardar Cambios' : 'Crear Proveedor',
              icono: editando ? Icons.save : Icons.add_circle,
              alPresionar: _guardar,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _construirDropdown({
    required String label,
    required IconData icon,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    required ColorScheme colorScheme,
    required bool isDark,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
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
      items: items.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
      onChanged: onChanged,
      validator: Validadores.requerido,
    );
  }

  Widget _construirSelectoresUbicacion(AsyncValue<List<Provincia>> provinciasAsync, ColorScheme colorScheme, bool isDark) {
    return provinciasAsync.when(
      loading: () => const LinearProgressIndicator(),
      error: (_, __) => const Text('Error al cargar provincias'),
      data: (provincias) {
        if (_provinciaSeleccionada != null) {
          _cantonesDisponibles = provincias.firstWhere((p) => p.nombre == _provinciaSeleccionada).cantones;
        }
        return Column(
          children: [
            _construirDropdown(
              label: 'Provincia *',
              icon: Icons.map_outlined,
              value: _provinciaSeleccionada,
              items: provincias.map((p) => p.nombre).toList(),
              onChanged: (v) => setState(() {
                _provinciaSeleccionada = v;
                _ciudadSeleccionada = null;
              }),
              colorScheme: colorScheme,
              isDark: isDark,
            ),
            const SizedBox(height: 16),
            _construirDropdown(
              label: 'Ciudad / Cantón *',
              icon: Icons.location_city_outlined,
              value: _ciudadSeleccionada,
              items: _cantonesDisponibles.map((c) => c.nombre).toList(),
              onChanged: (v) => setState(() => _ciudadSeleccionada = v),
              colorScheme: colorScheme,
              isDark: isDark,
            ),
          ],
        );
      },
    );
  }

  Future<void> _guardar() async {
    if (!_formKey.currentState!.validate()) {
      MensajesGlobales.advertenciaCampos('Completa todos los campos obligatorios');
      return;
    }

    try {
      final notifier = ref.read(proveedoresControllerProvider.notifier);
      final precio = double.parse(_precioController.text.replaceAll(',', '.'));
      final dias = int.tryParse(_diasCreditoController.text) ?? 0;

      if (widget.editar != null) {
        await notifier.editar(
          idExterno: widget.editar!.idExterno,
          nombre: _nombreController.text.trim(),
          rucCi: _rucController.text.trim(),
          contactoNombre: _contactoNombreController.text.trim(),
          contactoTelefono: _contactoTelefonoController.text.trim(),
          contactoCorreo: _contactoCorreoController.text.trim(),
          direccionProvincia: _provinciaSeleccionada!,
          direccionCiudad: _ciudadSeleccionada!,
          direccionDetalle: _direccionDetalleController.text.trim(),
          precioActual: precio,
          tipo: _tipoSeleccionado!,
          formaPago: _formaPagoSeleccionada,
          diasCredito: dias,
          observaciones: _observacionesController.text.trim(),
        );
      } else {
        await notifier.crear(
          nombre: _nombreController.text.trim(),
          rucCi: _rucController.text.trim(),
          contactoNombre: _contactoNombreController.text.trim(),
          contactoTelefono: _contactoTelefonoController.text.trim(),
          contactoCorreo: _contactoCorreoController.text.trim(),
          direccionProvincia: _provinciaSeleccionada!,
          direccionCiudad: _ciudadSeleccionada!,
          direccionDetalle: _direccionDetalleController.text.trim(),
          precioActual: precio,
          tipo: _tipoSeleccionado!,
          formaPago: _formaPagoSeleccionada,
          diasCredito: dias,
          observaciones: _observacionesController.text.trim(),
        );
      }
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      // Manejado por el provider
    }
  }
}