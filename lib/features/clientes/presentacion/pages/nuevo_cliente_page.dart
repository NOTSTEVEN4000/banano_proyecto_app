import 'package:banano_proyecto_app/core/data/provincias_service.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/core/utils/validadores.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class NuevoClientePage extends ConsumerStatefulWidget {
  final ClienteEntity? editar;
  const NuevoClientePage({super.key, this.editar});

  @override
  ConsumerState<NuevoClientePage> createState() => _NuevoClientePageState();
}

class _NuevoClientePageState extends ConsumerState<NuevoClientePage> {
  final _formKey = GlobalKey<FormState>();
  String? _rucError; // ← Para mostrar error en tiempo real

  // Controladores
  late final TextEditingController _nombreController;
  late final TextEditingController _rucController;
  late final TextEditingController _contactoNombreController;
  late final TextEditingController _contactoTelefonoController;
  late final TextEditingController _direccionController;
  late final TextEditingController _precioController;

  // Variables para dropdowns
  String? _provinciaSeleccionada;
  String? _ciudadSeleccionada;
  List<Canton> _cantonesDisponibles = [];

  @override
  void initState() {
    super.initState();
    final e = widget.editar;
    _nombreController = TextEditingController(text: e?.nombre);
    _rucController = TextEditingController(text: e?.rucCi);
    _contactoNombreController = TextEditingController(text: e?.contactoNombre);
    _contactoTelefonoController = TextEditingController(
      text: e?.contactoTelefono,
    );
    _direccionController = TextEditingController(text: e?.direccionDetalle);
    _precioController = TextEditingController(text: e?.precioActual.toString());

    // Valores iniciales para edición
    if (e != null) {
      _provinciaSeleccionada = e.direccionProvincia;
      _ciudadSeleccionada = e.direccionCiudad;
    }
    _rucController.addListener(_validarRucEnTiempoReal);
  }

  @override
  void dispose() {
    _rucController.removeListener(_validarRucEnTiempoReal);
    for (var c in [
      _nombreController,
      _rucController,
      _contactoNombreController,
      _contactoTelefonoController,
      _direccionController,
      _precioController,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _validarRucEnTiempoReal() async {
    final ruc = _rucController.text.trim();
    // Si está vacío → no mostrar error (el validator requerido se encarga)
    if (ruc.isEmpty) {
      setState(() => _rucError = null);
      return;
    }
    // Validar formato (solo números, 10 o 13 dígitos)
    final errorFormato = Validadores.rucCiValido(ruc);
    if (errorFormato != null) {
      setState(() => _rucError = errorFormato);
      return;
    }
    // Si formato OK → comprobar duplicado en Isar
    await _comprobarRucDuplicado(ruc);
  }

  Future<void> _comprobarRucDuplicado(String ruc) async {
    final isar = ref.read(isarProvider);
    if (widget.editar != null && ruc == widget.editar!.rucCi?.trim()) {
      setState(() => _rucError = null);
      return;
    }
    final existente = await isar.clienteEntitys
        .filter()
        .rucCiEqualTo(ruc)
        .findFirst();
    if (existente == null) {
      setState(() => _rucError = null);
      return;
    }
    setState(() {
      _rucError = 'Este RUC/CI ya está registrado en otro cliente';
    });
  }

  Future<void> _guardar() async {
    if (!_formKey.currentState!.validate()) return;
    if (_provinciaSeleccionada == null || _ciudadSeleccionada == null) {
      MensajesGlobales.advertencia('Selecciona provincia y ciudad');
      return;
    }

    final cli = widget.editar;
    final notifier = ref.read(clientesControllerProvider.notifier);

    try {
      if (cli != null) {
        await notifier.editar(
          idExterno: cli.idExterno,
          nombre: _nombreController.text,
          rucCi: _rucController.text,
          cNombre: _contactoNombreController.text,
          cTelefono: _contactoTelefonoController.text,

          dProvincia: _provinciaSeleccionada!,
          dCiudad: _ciudadSeleccionada!,
          dDetalle: _direccionController.text,
          precio: double.parse(_precioController.text),
        );
      } else {
        await notifier.crear(
          nombre: _nombreController.text,
          rucCi: _rucController.text,
          cNombre: _contactoNombreController.text,
          cTelefono: _contactoTelefonoController.text,
          dProvincia: _provinciaSeleccionada!,
          dCiudad: _ciudadSeleccionada!,
          dDetalle: _direccionController.text,
          precio: double.parse(_precioController.text),
        );
      }
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      MensajesGlobales.error('Error al guardar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final roleManager = ref.watch(roleManagerProvider);
    final esAdministrador = roleManager.esAdministrador;
    final provinciasAsync = ref.watch(provinciasProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editar == null ? 'Nuevo Cliente' : 'Editar Cliente'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _sectionTitle('Datos de la Empresa'),
            _buildField(
              _nombreController,
              'Nombre de la Empresa',
              Icons.business,
              validator: (v) =>
                  Validadores.requerido(v) ??
                  Validadores.soloLetras(v, 'Nombre'),
            ),
            const SizedBox(height: 12),
            _buildField(
              _rucController,
              'RUC / CI (10 o 13 dígitos)',
              Icons.badge,
              keyboard: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (v) {
                final error =
                    Validadores.rucCiValido(v) ?? Validadores.requerido(v);
                if (error != null) return error;
                if (_rucError != null && _rucError!.contains('registrado')) {
                  return _rucError;
                }
                return null;
              },
              errorText: _rucError, // ← Muestra error en tiempo real
              enabled: esAdministrador || widget.editar == null,
            ),

            const SizedBox(height: 24),
            _sectionTitle('Contacto'),
            _buildField(
              _contactoNombreController,
              'Nombre del contacto',
              Icons.person,
              validator: (v) =>
                  Validadores.requerido(v) ??
                  Validadores.soloLetras(v, 'Nombre del contacto'),
            ),
            const SizedBox(height: 12),
            _buildField(
              _contactoTelefonoController,
              'Teléfono',
              Icons.phone,
              keyboard: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: Validadores.telefonoEcuador,
            ),

            const SizedBox(height: 24),
            _sectionTitle('Ubicación'),
            // Dropdowns de provincia y ciudad
            provinciasAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, _) => const Text(
                'Error al cargar ubicaciones',
                style: TextStyle(color: Colors.red),
              ),
              data: (provincias) {
                // Actualizar cantones cuando cambie provincia
                if (_provinciaSeleccionada != null) {
                  final prov = provincias.firstWhere(
                    (p) => p.nombre == _provinciaSeleccionada,
                  );
                  _cantonesDisponibles = prov.cantones;
                }

                return Column(
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: _provinciaSeleccionada,
                      decoration: const InputDecoration(
                        labelText: 'Provincia',
                        prefixIcon: Icon(Icons.map),
                        border: OutlineInputBorder(),
                      ),
                      items: provincias.map((p) {
                        return DropdownMenuItem(
                          value: p.nombre,
                          child: Text(p.nombre),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _provinciaSeleccionada = value;
                          _ciudadSeleccionada = null;
                          if (value != null) {
                            final prov = provincias.firstWhere(
                              (p) => p.nombre == value,
                            );
                            _cantonesDisponibles = prov.cantones;
                          }
                        });
                      },
                      validator: (v) =>
                          v == null ? 'Selecciona una provincia' : null,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: _ciudadSeleccionada,
                      decoration: const InputDecoration(
                        labelText: 'Ciudad / Cantón',
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(),
                      ),
                      items: _cantonesDisponibles.map((c) {
                        return DropdownMenuItem(
                          value: c.nombre,
                          child: Text(c.nombre),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() => _ciudadSeleccionada = value);
                      },
                      validator: (v) =>
                          v == null ? 'Selecciona una ciudad' : null,
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 12),
            _buildField(
              _direccionController,
              'Dirección detallada',
              Icons.directions,
              validator: Validadores.direccionValida,
            ),

            const SizedBox(height: 24),
            _sectionTitle('Tarifa'),
            _buildField(
              _precioController,
              'Precio por caja (USD)',
              Icons.attach_money,
              keyboard: TextInputType.numberWithOptions(decimal: true),
              prefix: '\$ ',
              validator: Validadores.precioValido,
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: _guardar,
              child: const Text(
                'GUARDAR CLIENTE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
      ),
    ),
  );

  Widget _buildField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType? keyboard,
    List<TextInputFormatter>? inputFormatters,
    String? prefix,
    String? Function(String?)? validator,
    bool required = true,
    bool enabled = true,
    String? errorText,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      validator: validator ?? (required ? Validadores.requerido : null),
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        prefixText: prefix,
        errorText: errorText, // ← Aquí se muestra el error en tiempo real
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
