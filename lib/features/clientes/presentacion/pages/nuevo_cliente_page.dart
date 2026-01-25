import 'package:banano_proyecto_app/core/data/provincias_service.dart';
import 'package:banano_proyecto_app/core/ui/widgets/botones.dart';
import 'package:banano_proyecto_app/core/ui/widgets/campos_formulario.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/core/utils/validadores.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';


class NuevoClientePage extends ConsumerStatefulWidget {
  final ClienteEntity? editar;
  const NuevoClientePage({super.key, this.editar});

  @override
  ConsumerState<NuevoClientePage> createState() => _NuevoClientePageState();
}

class _NuevoClientePageState extends ConsumerState<NuevoClientePage> {
  final _llaveFormulario = GlobalKey<FormState>();
  String? _errorRucTiempoReal;

  late final TextEditingController _ctrlNombre,
      _ctrlRuc,
      _ctrlContacto,
      _ctrlTelefono,
      _ctrlDireccion,
      _ctrlPrecio,
      _ctrlCorreo,
      _ctrlObservaciones;

  String? _provincia, _ciudad;
  List<Canton> _cantones = [];

  @override
  void initState() {
    super.initState();
    _inicializarControladores();
    _configurarListeners();
  }

  void _inicializarControladores() {
    final e = widget.editar;
    _ctrlNombre = TextEditingController(text: e?.nombre);
    _ctrlRuc = TextEditingController(text: e?.rucCi);
    _ctrlContacto = TextEditingController(text: e?.contactoNombre);
    _ctrlTelefono = TextEditingController(text: e?.contactoTelefono);
    _ctrlDireccion = TextEditingController(text: e?.direccionDetalle);
    _ctrlCorreo = TextEditingController(text: e?.contactoCorreo);
    _ctrlObservaciones = TextEditingController(text: e?.observaciones);

    String valorInicial = '0,00';
    if (e != null) {
      valorInicial = _obtenerTextoMoneda(
        (e.precioActual * 100).toInt().toString(),
      );
    }
    _ctrlPrecio = TextEditingController(text: valorInicial);

    _provincia = e?.direccionProvincia;
    _ciudad = e?.direccionCiudad;
  }

  void _configurarListeners() {
    _ctrlRuc.addListener(_gestionarValidacionRuc);
    _ctrlPrecio.addListener(_gestionarFormatoPrecio);
  }

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlRuc.dispose();
    _ctrlContacto.dispose();
    _ctrlTelefono.dispose();
    _ctrlDireccion.dispose();
    _ctrlPrecio.dispose();
    _ctrlCorreo.dispose();
    _ctrlObservaciones.dispose();
    super.dispose();
  }

  void _gestionarFormatoPrecio() {
    String actual = _ctrlPrecio.text;
    String soloNumeros = actual.replaceAll(RegExp(r'[^\d]'), '');
    if (soloNumeros.isEmpty) soloNumeros = '0';
    String formateado = _obtenerTextoMoneda(soloNumeros);
    if (actual != formateado) {
      _ctrlPrecio.value = TextEditingValue(
        text: formateado,
        selection: TextSelection.collapsed(offset: formateado.length),
      );
    }
  }

  String _obtenerTextoMoneda(String digitos) {
    double valor = (double.tryParse(digitos) ?? 0) / 100;
    return NumberFormat.currency(
      locale: "es_EC",
      symbol: "",
      decimalDigits: 2,
    ).format(valor).trim();
  }

  Future<void> _gestionarValidacionRuc() async {
    final ruc = _ctrlRuc.text.trim();
    if (ruc.isEmpty) {
      setState(() => _errorRucTiempoReal = null);
      return;
    }
    if (widget.editar != null && ruc == widget.editar!.rucCi) {
      setState(() => _errorRucTiempoReal = null);
      return;
    }
    final errorLocal = Validadores.rucCiValido(ruc);
    if (errorLocal != null) {
      setState(() => _errorRucTiempoReal = errorLocal);
      return;
    }
    final isar = ref.read(isarProvider);
    final existe = await isar.clienteEntitys
        .filter()
        .rucCiEqualTo(ruc)
        .findFirst();
    setState(
      () => _errorRucTiempoReal = existe != null ? 'RUC ya registrado' : null,
    );
  }

  Future<void> _ejecutarGuardado() async {
    if (!_llaveFormulario.currentState!.validate()) return;
    if (_errorRucTiempoReal != null) {
      MensajesGlobales.error(_errorRucTiempoReal!);
      return;
    }
    if (_provincia == null || _ciudad == null) {
      MensajesGlobales.advertenciaCampos('Complete el campo de ubicación');
      return;
    }

    final notifier = ref.read(clientesControllerProvider.notifier);
    final internet = ref.read(internetConnectionProvider).valueOrNull ?? false;
    double precioLimpio = double.parse(
      _ctrlPrecio.text.replaceAll('.', '').replaceAll(',', '.'),
    );

    try {
      if (widget.editar != null) {
        await notifier.editar(
          idExterno: widget.editar!.idExterno,
          nombre: _ctrlNombre.text,
          rucCi: _ctrlRuc.text,
          cNombre: _ctrlContacto.text,
          cTelefono: _ctrlTelefono.text,
          dProvincia: _provincia!,
          dCiudad: _ciudad!,
          dDetalle: _ctrlDireccion.text,
          precio: precioLimpio,
          observaciones: _ctrlObservaciones.text,
        );
      } else {
        await notifier.crear(
          nombre: _ctrlNombre.text,
          rucCi: _ctrlRuc.text,
          cNombre: _ctrlContacto.text,
          cTelefono: _ctrlTelefono.text,
          dProvincia: _provincia!,
          dCiudad: _ciudad!,
          dDetalle: _ctrlDireccion.text,
          precio: precioLimpio,
          observaciones: _ctrlObservaciones.text,
        );
      }
      if (mounted) {
        MensajesGlobales.exito(internet ? 'Guardado en la nube' : 'Guardado localmente');
        Navigator.pop(context, true);
      }
    } catch (e) {
      MensajesGlobales.error('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final provinciasAsync = ref.watch(provinciasProvider);
    final esAdmin = ref.watch(roleManagerProvider).esAdministrador;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editar == null ? 'Nuevo Cliente' : 'Editar Cliente'),
      ),
      body: Form(
        key: _llaveFormulario,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          children: [
            _subtituloStyled('Datos de la Empresa', colorScheme),
            componenteCampoTexto(
              controlador: _ctrlNombre,
              etiqueta: 'Nombre de la Empresa',
              icono: Icons.business,
              funcionValidacion: (v) =>
                  Validadores.requerido(v) ?? Validadores.soloLetras(v, 'Nombre'),
            ),
            const SizedBox(height: 16),
            componenteCampoTexto(
              controlador: _ctrlRuc,
              etiqueta: 'RUC / CI',
              icono: Icons.badge,
              tipoTeclado: TextInputType.number,
              habilitado: esAdmin || widget.editar == null,
              textoError: _errorRucTiempoReal,
              funcionValidacion: (v) {
                final errorBase = Validadores.requerido(v) ?? Validadores.rucCiValido(v);
                if (errorBase != null) return errorBase;
                return _errorRucTiempoReal;
              },
            ),
            const SizedBox(height: 32),
            _subtituloStyled('Contacto del Cliente', colorScheme),
            componenteCampoTexto(
              controlador: _ctrlContacto,
              etiqueta: 'Nombre del Contacto',
              icono: Icons.person_outline,
              funcionValidacion: (v) => Validadores.requerido(v),
            ),
            const SizedBox(height: 16),
            componenteCampoTexto(
              controlador: _ctrlTelefono,
              etiqueta: 'Teléfono / WhatsApp',
              icono: Icons.phone_android,
              tipoTeclado: TextInputType.phone,
              formateadores: [FilteringTextInputFormatter.digitsOnly],
              funcionValidacion: (v) => Validadores.telefonoEcuador(v),
            ),
            const SizedBox(height: 16),
            componenteCampoTexto(
              controlador: _ctrlCorreo,
              etiqueta: 'Correo Electrónico',
              icono: Icons.email_outlined,
              tipoTeclado: TextInputType.emailAddress,
            ),
            const SizedBox(height: 32),
            _subtituloStyled('Ubicación', colorScheme),
            _construirSelectoresUbicacion(provinciasAsync, colorScheme),
            const SizedBox(height: 16),
            componenteCampoTexto(
              controlador: _ctrlDireccion,
              etiqueta: 'Dirección detallada (Calle, Número, Ref)',
              icono: Icons.directions,
              funcionValidacion: Validadores.direccionValida,
            ),
            const SizedBox(height: 32),
            _subtituloStyled('Tarifa y Observaciones', colorScheme),
            componenteCampoTexto(
              controlador: _ctrlPrecio,
              etiqueta: 'Precio por caja *',
              icono: Icons.attach_money_outlined,
              tipoTeclado: TextInputType.number,
              formateadores: [FilteringTextInputFormatter.digitsOnly],
              funcionValidacion: Validadores.precioValido,
            ),
            const SizedBox(height: 16),
            componenteCampoTexto(
              controlador: _ctrlObservaciones,
              etiqueta: 'Observaciones / Notas adicionales',
              icono: Icons.edit_note,
              maxLines: 3,
            ),
            const SizedBox(height: 48),
            botonPrincipal(
              etiqueta: widget.editar == null ? 'Guardar Cliente' : 'Actualizar Cambios',
              icono: widget.editar == null ? Icons.save_rounded : Icons.edit_document,
              alPresionar: _errorRucTiempoReal == null ? _ejecutarGuardado : null,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _subtituloStyled(String texto, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 4),
      child: Text(
        texto.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 12,
          letterSpacing: 1.2,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  Widget _construirSelectoresUbicacion(
    AsyncValue<List<Provincia>> provinciasAsync,
    ColorScheme colorScheme,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final decoration = InputDecoration(
      filled: true,
      fillColor: isDark ? colorScheme.surfaceContainer : Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.5)),
      ),
    );

    return provinciasAsync.when(
      loading: () => const LinearProgressIndicator(),
      error: (_, _) => const Text('Error al cargar ubicaciones'),
      data: (lista) {
        if (_provincia != null) {
          final provEncontrada = lista.firstWhere(
            (p) => p.nombre == _provincia,
            orElse: () => lista.first,
          );
          _cantones = provEncontrada.cantones;
        }

        return Column(
          children: [
            DropdownButtonFormField<String>(
              value: _provincia,
              decoration: decoration.copyWith(labelText: 'Provincia'),
              items: lista.map((p) => DropdownMenuItem(value: p.nombre, child: Text(p.nombre))).toList(),
              onChanged: (val) => setState(() {
                _provincia = val;
                _ciudad = null;
              }),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _ciudad,
              decoration: decoration.copyWith(labelText: 'Ciudad'),
              items: _cantones.map((c) => DropdownMenuItem(value: c.nombre, child: Text(c.nombre))).toList(),
              onChanged: (val) => setState(() => _ciudad = val),
            ),
          ],
        );
      },
    );
  }
}