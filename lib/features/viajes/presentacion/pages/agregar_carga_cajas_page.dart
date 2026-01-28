import 'package:banano_proyecto_app/core/ui/widgets/botones.dart';
import 'package:banano_proyecto_app/core/ui/widgets/campos_formulario.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/core/utils/validadores.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/agregar_carga_cajas_dto.dart';
import 'package:banano_proyecto_app/features/viajes/data/models/viaje_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarCargaCajasPage extends ConsumerStatefulWidget {
  final ViajeEntity viaje;

  const AgregarCargaCajasPage({super.key, required this.viaje});

  @override
  ConsumerState<AgregarCargaCajasPage> createState() => _AgregarCargaCajasPageState();
}

class _AgregarCargaCajasPageState extends ConsumerState<AgregarCargaCajasPage> {
  final _formKey = GlobalKey<FormState>();
  final _cantidadController = TextEditingController();
  bool _estaCargando = false;

  @override
  void dispose() {
    _cantidadController.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  final isDark = Theme.of(context).brightness == Brightness.dark;

  final proveedoresAsync = ref.watch(proveedoresControllerProvider);
  final clientesAsync = ref.watch(clientesControllerProvider);

  // 1. Obtener datos de Hacienda (Proveedor)
  final proveedor = proveedoresAsync.maybeWhen(
    data: (listado) => listado.where((p) => p.idExterno == widget.viaje.haciendaIdExterno).firstOrNull,
    orElse: () => null,
  );
  final nombreHacienda = proveedor?.nombre ?? 'Cargando...';
  final precioCompra = proveedor?.precioActual ?? 0.0;

  // 2. Obtener datos del Cliente
  final cliente = clientesAsync.maybeWhen(
    data: (listado) => listado.where((c) => c.idExterno == widget.viaje.clienteIdExterno).firstOrNull,
    orElse: () => null,
  );
  final nombreCliente = cliente?.nombre ?? 'Venta Local / No asignado';
  final precioVenta = cliente?.precioActual ?? 0.0; // Asumiendo que tu modelo Cliente tiene precioActual

  return Scaffold(
    appBar: AppBar(title: const Text('Registrar Carga')),
    body: Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? colorScheme.surfaceContainerHighest : colorScheme.primaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colorScheme.primary.withOpacity(0.2)),
            ),
            child: Column(
              children: [
                _infoRow(context, Icons.location_on_outlined, 'Origen (Hacienda)', nombreHacienda),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: colorScheme.outlineVariant.withOpacity(0.4)),
                ),
                _infoRow(context, Icons.person_outline, 'Destino (Cliente)', nombreCliente),
                
                const SizedBox(height: 16),
                
                // PANEL DE PRECIOS
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: colorScheme.surface.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _precioMiniCol("Compra", precioCompra, Colors.orange),
                      Container(width: 1, height: 20, color: colorScheme.outlineVariant),
                      _precioMiniCol("Venta", precioVenta, Colors.green),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
          subtituloSeccion('Detalles de la Carga'),

          componenteCampoTexto(
            controlador: _cantidadController,
            etiqueta: 'Cantidad de cajas *',
            icono: Icons.inventory_2_outlined,
            tipoTeclado: TextInputType.number,
            funcionValidacion: Validadores.requerido,
          ),

          const SizedBox(height: 32),

          botonPrincipal(
            etiqueta: 'CONFIRMAR CARGA',
            icono: Icons.check_circle_outline,
            alPresionar: _estaCargando ? null : () => _guardar(precioCompra, precioVenta),
          ),
        ],
      ),
    ),
  );
}

// Widget auxiliar para mostrar los precios en el card
Widget _precioMiniCol(String label, double valor, Color color) {
  return Column(
    children: [
      Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
      Text(
        "\$${valor.toStringAsFixed(2)}",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color),
      ),
    ],
  );
}

// Actualizamos el guardar para recibir ambos precios
Future<void> _guardar(double costoCompra, double precioVenta) async {
  if (!_formKey.currentState!.validate()) return;

  final cantidad = int.tryParse(_cantidadController.text);
  if (cantidad == null) {
    MensajesGlobales.advertencia('Ingrese una cantidad válida');
    return;
  }

  setState(() => _estaCargando = true);

  try {
    final dto = AgregarCargaCajasDto(
      idExterno: 'CC-${DateTime.now().millisecondsSinceEpoch}',
      proveedorIdExterno: widget.viaje.haciendaIdExterno!,
      haciendaIdExterno: widget.viaje.haciendaIdExterno ?? '',
      cantidadCajas: cantidad,
      costoCompraUnitario: costoCompra,
      clienteIdExterno: widget.viaje.clienteIdExterno,
      precioVentaUnitario: precioVenta, // Ahora enviamos el precio de venta real
    );

    await ref.read(viajesControllerProvider.notifier).agregarCargaCajas(widget.viaje.idExterno, dto);

    if (mounted) {
      MensajesGlobales.exito('Carga registrada correctamente');
      Navigator.pop(context);
    }
  } catch (e) {
    MensajesGlobales.error('Error: $e');
  } finally {
    if (mounted) setState(() => _estaCargando = false);
  }
}

    Widget _infoRow(BuildContext context, IconData icon, String label, String value) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: colorScheme.primary.withOpacity(0.1), shape: BoxShape.circle),
          child: Icon(icon, color: colorScheme.primary, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant)),
              Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colorScheme.onSurface)),
            ],
          ),
        ),
      ],
    );
  }
}
