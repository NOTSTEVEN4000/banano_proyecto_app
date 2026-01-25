import 'package:banano_proyecto_app/core/ui/widgets/mostrar_dialogos.dart';
import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:banano_proyecto_app/core/utils/formateadores.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/proveedores/data/models/proveedor_entity.dart';
import 'package:banano_proyecto_app/features/proveedores/presentacion/pages/nuevo_proveedor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetalleProveedorPage extends ConsumerStatefulWidget {
  final ProveedorEntity proveedor;

  const DetalleProveedorPage({super.key, required this.proveedor});

  @override
  ConsumerState<DetalleProveedorPage> createState() =>
      _DetalleProveedorPageState();
}

class _DetalleProveedorPageState extends ConsumerState<DetalleProveedorPage> {
  late ProveedorEntity proveedor;

  @override
  void initState() {
    super.initState();
    proveedor = widget.proveedor;
  }

  // Verifica si el registro es nuevo y no ha tocado el servidor
  bool get _esSoloLocal =>
      proveedor.idExterno.isEmpty || proveedor.pendienteSync;

  Future<void> _recargarProveedor() async {
    try {
      final proveedoresAsync = ref.read(proveedoresControllerProvider);
      final lista = proveedoresAsync.asData?.value;
      if (lista == null) return;

      final actualizado = lista.firstWhere(
        (p) =>
            p.idExterno == widget.proveedor.idExterno ||
            p.id == widget.proveedor.id,
      );

      setState(() => proveedor = actualizado);
    } catch (e) {
      debugPrint('Error recargando: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final proveedoresAsync = ref.watch(proveedoresControllerProvider);
    final proveedorActual = proveedoresAsync.maybeWhen(
      data: (lista) => lista.firstWhere(
        (p) =>
            p.idExterno == widget.proveedor.idExterno ||
            p.id == widget.proveedor.id,
        orElse: () => proveedor, // Si no lo encuentra, usa el local
      ),
      orElse: () => proveedor,
    );
    proveedor = proveedorActual;
    final roleManager = ref.watch(roleManagerProvider);
    final esAdmin = roleManager.esAdministrador;
    final puedeAccionar = roleManager.puedeEditar || roleManager.puedeEliminar;
    final estaActivo = proveedor.activo;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _getAvatarColor(proveedor),
        foregroundColor: Colors.white,
        title: const Text(
          'Detalle de Proveedor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // BOTÓN EDITAR
          if (puedeAccionar)
            IconButton(
              icon: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.edit, color: Colors.indigo, size: 18),
              ),
              onPressed: () => _manejarEdicion(),
            ),

          // BOTÓN ELIMINAR (Lógica de bloqueo local)
          if (puedeAccionar && estaActivo)
            IconButton(
              icon: CircleAvatar(
                radius: 16,
                backgroundColor: _esSoloLocal
                    ? Colors.white.withOpacity(0.5)
                    : Colors.white,
                child: Icon(
                  Icons.delete_rounded,
                  color: _esSoloLocal ? Colors.grey : Colors.red.shade700,
                  size: 18,
                ),
              ),
              onPressed: _esSoloLocal
                  ? () => MensajesGlobales.advertencia(
                      'No puedes eliminar un proveedor que no ha sido sincronizado.',
                    )
                  : () => _confirmarEliminacionDoble(context, ref),
            ),

          // BOTÓN REACTIVAR
          if (esAdmin && !estaActivo)
            IconButton(
              icon: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.restore, color: Colors.green, size: 18),
              ),
              onPressed: () => _reactivarProveedor(context, ref),
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildEncabezado(),
            const SizedBox(height: 24),

            if (_esSoloLocal) _buildBannerPendiente(),

            _seccionInfo('Información Comercial', [
              _filaInfo(
                Icons.badge_outlined,
                'RUC / CI',
                proveedor.rucCi ?? 'No registrado',
              ),
              _filaInfo(
                Icons.monetization_on_outlined,
                'Precio acordado',
                Formateadores.formatearPrecio(
                  proveedor.precioActual,
                  proveedor.moneda,
                ),
              ),
              _filaInfo(
                Icons.category_outlined,
                'Tipo de Empresa',
                proveedor.tipo,
              ),
            ]),

            const SizedBox(height: 20),
            _seccionInfo('Contacto Directo', [
              _filaInfo(
                Icons.person_outline,
                'Representante',
                proveedor.contactoNombre,
              ),
              _filaInfo(
                Icons.phone_android_outlined,
                'Teléfono',
                proveedor.contactoTelefono,
              ),
              if (proveedor.contactoCorreo != null)
                _filaInfo(
                  Icons.email_outlined,
                  'Correo electrónico',
                  proveedor.contactoCorreo!,
                ),
            ]),

            const SizedBox(height: 20),
            _seccionInfo('Ubicación y Logística', [
              _filaInfo(
                Icons.map_outlined,
                'Provincia',
                proveedor.direccionProvincia,
              ),
              _filaInfo(
                Icons.location_city_outlined,
                'Ciudad',
                proveedor.direccionCiudad,
              ),
              _filaInfo(
                Icons.directions_outlined,
                'Dirección exacta',
                proveedor.direccionDetalle,
              ),
            ]),

            const SizedBox(height: 20),
            _seccionInfo('Estado Financiero', [
              _filaInfo(
                Icons.account_balance_wallet_outlined,
                'Saldo Pendiente',
                Formateadores.formatearPrecio(
                  proveedor.saldoPorPagar,
                  proveedor.moneda,
                ),
                colorValor: proveedor.saldoPorPagar > 0
                    ? Colors.red
                    : Colors.green,
              ),
            ]),

            if (proveedor.observaciones?.isNotEmpty ?? false) ...[
              const SizedBox(height: 20),
              _seccionInfo('Notas Adicionales', [
                _filaInfo(
                  Icons.description_outlined,
                  'Observaciones',
                  proveedor.observaciones!,
                ),
              ]),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildEncabezado() {
    return Center(
      child: Column(
        children: [
          Hero(
            tag: 'avatar_${proveedor.id}',
            child: CircleAvatar(
              radius: 50,
              backgroundColor: _getAvatarColor(proveedor),
              child: Text(
                proveedor.nombre.isNotEmpty
                    ? proveedor.nombre[0].toUpperCase()
                    : '?',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            proveedor.nombre,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Chip(
            label: Text(
              proveedor.estado.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            backgroundColor: getColorPorEstado(proveedor.estado),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerPendiente() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.cloud_off_rounded, color: Colors.amber.shade800),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Este proveedor se creó localmente. La eliminación estará disponible tras la sincronización.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _manejarEdicion() async {
    if (!proveedor.activo) {
      final ok = await Dialogos.confirmar(
        context: context,
        titulo: 'Proveedor Inactivo',
        contenido: '¿Deseas editar este proveedor a pesar de estar inactivo?',
      );
      if (ok != true) return;
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NuevoProveedorPage(editar: proveedor)),
    );

    if (result == true) await _recargarProveedor();
  }

  Future<void> _confirmarEliminacionDoble(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final ok1 = await Dialogos.confirmarEliminar(
      context: context,
      nombre: proveedor.nombre,
      placa: proveedor.rucCi ?? 'N/A',
    );
    if (ok1 != true) return;

    final ok2 = await Dialogos.confirmar(
      context: context,
      titulo: '¿Estás completamente seguro?',
      contenido: 'Se eliminará el historial vinculado a este proveedor.',
      textoConfirmar: 'Eliminar definitivamente',
    );

    if (ok2 == true) {
      await ref
          .read(proveedoresControllerProvider.notifier)
          .eliminar(proveedor.idExterno);
      if (context.mounted) Navigator.pop(context);
    }
  }

  Future<void> _reactivarProveedor(BuildContext context, WidgetRef ref) async {
    final ok = await Dialogos.confirmar(
      context: context,
      titulo: 'Reactivar',
      contenido: '¿Deseas activar nuevamente a este proveedor?',
    );
    if (ok == true) {
      await ref
          .read(proveedoresControllerProvider.notifier)
          .reactivar(proveedor.idExterno);
      await _recargarProveedor();
    }
  }

  Widget _seccionInfo(String titulo, List<Widget> filas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            letterSpacing: 1.1,
          ),
        ),
        const Divider(),
        ...filas,
      ],
    );
  }

  Widget _filaInfo(
    IconData icon,
    String label,
    String value, {
    Color? colorValor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo.shade300, size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorValor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getAvatarColor(ProveedorEntity p) {
    if (!p.activo) return Colors.red.shade400;
    if (p.pendienteSync) return Colors.orange.shade400;
    return Colors.indigo.shade400;
  }
}
