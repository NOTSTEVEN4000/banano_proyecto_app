import 'package:banano_proyecto_app/core/data/provincias_service.dart';
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

  // Controladores
  late final TextEditingController _nombreController;
  late final TextEditingController _rucController;
  late final TextEditingController _contactoNombreController;
  late final TextEditingController _contactoTelefonoController;
  late final TextEditingController _contactoCorreoController;
  late final TextEditingController _direccionDetalleController;
  late final TextEditingController _precioController;
  late final TextEditingController _observacionesController;
  late final TextEditingController _diasCreditoController;

  // Dropdowns
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
    final editando = widget.editar != null;
    final provinciasAsync = ref.watch(provinciasProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(editando ? 'Editar Proveedor' : 'Nuevo Proveedor'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // === Información Principal ===
            _seccionTarjeta('Información Principal', [
              _campoTexto(_nombreController, 'Nombre / Razón Social *', Icons.business, validator: Validadores.requerido),
              const SizedBox(height: 16),
              _campoTexto(
                _rucController,
                'RUC / CI *',
                Icons.badge_outlined,
                keyboard: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                errorText: _rucError,
                validator: (v) => Validadores.rucCiValido(v) ?? _rucError,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _tipoSeleccionado,
                decoration: _decoracionCampo('Tipo de Proveedor *', Icons.category_outlined),
                items: ['HACIENDA', 'OTRO'].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                onChanged: (v) => setState(() => _tipoSeleccionado = v),
                validator: Validadores.requerido,
              ),
            ]),

            const SizedBox(height: 24),

            // === Contacto ===
            _seccionTarjeta('Datos de Contacto', [
              _campoTexto(_contactoNombreController, 'Nombre del contacto *', Icons.person_outline, validator: Validadores.requerido),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _campoTexto(
                      _contactoTelefonoController, 
                      'Teléfono *', 
                      Icons.phone_android_outlined, 
                      keyboard: TextInputType.phone, 
                      validator: Validadores.telefonoEcuador
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _campoTexto(_contactoCorreoController, 'Correo', Icons.email_outlined, keyboard: TextInputType.emailAddress),
                  ),
                ],
              ),
            ]),

            const SizedBox(height: 24),

            // === Ubicación ===
            _seccionTarjeta('Ubicación', [
              provinciasAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, _) => const Text('Error al cargar provincias'),
                data: (provincias) {
                  if (_provinciaSeleccionada != null) {
                    _cantonesDisponibles = provincias.firstWhere((p) => p.nombre == _provinciaSeleccionada).cantones;
                  }
                  return Column(
                    children: [
                      DropdownButtonFormField<String>(
                        initialValue: _provinciaSeleccionada,
                        decoration: _decoracionCampo('Provincia *', Icons.map_outlined),
                        items: provincias.map((p) => DropdownMenuItem(value: p.nombre, child: Text(p.nombre))).toList(),
                        onChanged: (v) => setState(() {
                          _provinciaSeleccionada = v;
                          _ciudadSeleccionada = null;
                        }),
                        validator: Validadores.requerido,
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        initialValue: _ciudadSeleccionada,
                        decoration: _decoracionCampo('Ciudad / Cantón *', Icons.location_city_outlined),
                        items: _cantonesDisponibles.map((c) => DropdownMenuItem(value: c.nombre, child: Text(c.nombre))).toList(),
                        onChanged: (v) => setState(() => _ciudadSeleccionada = v),
                        validator: Validadores.requerido,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              _campoTexto(_direccionDetalleController, 'Dirección detallada *', Icons.directions_outlined, validator: Validadores.direccionValida),
            ]),

            const SizedBox(height: 24),

            // === Finanzas ===
            _seccionTarjeta('Condiciones Comerciales', [
              _campoTexto(
                _precioController, 
                'Precio por caja *', 
                Icons.attach_money_outlined, 
                keyboard: const TextInputType.numberWithOptions(decimal: true),
                validator: Validadores.precioValido
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _formaPagoSeleccionada,
                decoration: _decoracionCampo('Forma de Pago *', Icons.payments_outlined),
                items: ['CONTADO', 'CREDITO', 'MIXTO'].map((f) => DropdownMenuItem(value: f, child: Text(f))).toList(),
                onChanged: (v) => setState(() => _formaPagoSeleccionada = v),
                validator: Validadores.requerido,
              ),
              if (_formaPagoSeleccionada == 'CREDITO') ...[
                const SizedBox(height: 16),
                _campoTexto(_diasCreditoController, 'Días de crédito', Icons.calendar_month_outlined, keyboard: TextInputType.number),
              ],
            ]),

            const SizedBox(height: 24),

            // === Observaciones ===
            _seccionTarjeta('Adicional', [
              _campoTexto(_observacionesController, 'Observaciones', Icons.note_alt_outlined, maxLines: 3),
            ]),

            const SizedBox(height: 40),

            // Botón Guardar
            FilledButton.icon(
              onPressed: _guardar,
              icon: Icon(editando ? Icons.save : Icons.add_circle),
              label: Text(
                editando ? 'Guardar Cambios' : 'Crear Proveedor',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
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
      // El mensaje de error ya debería estar en el controller con rethrow
    }
  }

  // ==================== WIDGETS HELPERS (IGUALES A VEHICULOS) ====================

  Widget _seccionTarjeta(String titulo, List<Widget> contenido) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            titulo,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.grey.withValues(alpha: 0.08), blurRadius: 15, offset: const Offset(0, 5)),
            ],
          ),
          child: Column(children: contenido),
        ),
      ],
    );
  }

  InputDecoration _decoracionCampo(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.grey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.indigo, width: 2),
      ),
    );
  }

  Widget _campoTexto(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType? keyboard,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      textCapitalization: TextCapitalization.sentences,
      decoration: _decoracionCampo(label, icon).copyWith(errorText: errorText),
      validator: validator,
    );
  }
}