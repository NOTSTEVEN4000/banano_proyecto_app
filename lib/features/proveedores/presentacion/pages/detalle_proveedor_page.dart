// lib/features/proveedores/presentacion/pages/detalle_proveedor_page.dart

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
  ConsumerState<DetalleProveedorPage> createState() => _DetalleProveedorPageState();
}

class _DetalleProveedorPageState extends ConsumerState<DetalleProveedorPage> {
  late ProveedorEntity proveedor;

  @override
  void initState() {
    super.initState();
    proveedor = widget.proveedor;
  }

  // Método para recargar el proveedor desde la base de datos local
  Future<void> _recargarProveedor() async {
    try {
      final proveedoresAsync = ref.read(proveedoresControllerProvider);
      final proveedores = proveedoresAsync.asData?.value;
      if (proveedores == null) throw Exception('No hay datos de proveedores');
      
      final proveedorActualizado = proveedores.firstWhere(
        (p) => p.idExterno == widget.proveedor.idExterno,
      );

      setState(() {
        proveedor = proveedorActualizado;
      });
    } catch (e) {
      if (mounted) {
        MensajesGlobales.error('No se pudo actualizar la información del proveedor');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final roleManager = ref.watch(roleManagerProvider);
    final esAdministrador = roleManager.esAdministrador;
    final puedeEditarEliminar = roleManager.puedeEditar || roleManager.puedeEliminar;
    final estaActivo = proveedor.activo;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _getAvatarColor(proveedor),
        foregroundColor: Colors.white,
        title: Text(
          proveedor.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // Botón Editar
          if (puedeEditarEliminar)
            IconButton(
              icon: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.edit,
                  color: Colors.indigo.shade700,
                  size: 20,
                ),
              ),
              tooltip: 'Editar proveedor',
              onPressed: () async {
                if (!estaActivo) {
                  final confirmar = await Dialogos.confirmar(
                    context: context,
                    titulo: 'Proveedor inactivo',
                    contenido: 'Este proveedor está inactivo. ¿Deseas editarlo de todos modos?',
                    textoConfirmar: 'Sí, editar',
                    colorConfirmar: Colors.orange.shade600,
                  );
                  if (confirmar != true) return;
                }

                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NuevoProveedorPage(editar: proveedor),
                  ),
                );

                if (resultado == true) {
                  await _recargarProveedor();
                }
              },
            ),

          // Botón Eliminar (solo si está activo)
          if (puedeEditarEliminar && estaActivo)
            IconButton(
              icon: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.delete_rounded,
                  color: Colors.red.shade700,
                  size: 20,
                ),
              ),
              tooltip: 'Eliminar proveedor',
              onPressed: () => _confirmarEliminacionDoble(context, ref),
            ),

          // Botón Reactivar (solo admin e inactivo)
          if (esAdministrador && !estaActivo)
            IconButton(
              icon: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.restore,
                  color: Colors.green.shade700,
                  size: 20,
                ),
              ),
              tooltip: 'Reactivar proveedor',
              onPressed: () => _reactivarProveedor(context, ref),
            ),

          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: _getAvatarColor(proveedor),
                    child: Text(
                      proveedor.nombre.isNotEmpty ? proveedor.nombre[0].toUpperCase() : '?',
                      style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    proveedor.nombre,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: getColorPorEstado(proveedor.estado),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      proveedor.estado,
                      style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (proveedor.pendienteSync) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade600,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.cloud_upload, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Pendiente de sincronización',
                            style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 32),

            _seccionInfo('Información básica', [
              _filaInfo(Icons.badge, 'RUC/CI', proveedor.rucCi ?? 'No registrado'),
              _filaInfo(Icons.attach_money, 'Precio por caja', Formateadores.formatearPrecio(proveedor.precioActual, proveedor.moneda)),
              _filaInfo(Icons.attach_money, 'Tipo de proveedor', proveedor.tipo),

            ]),

            const SizedBox(height: 24),

            _seccionInfo('Contacto', [
              _filaInfo(Icons.person, 'Nombre', proveedor.contactoNombre),
              _filaInfo(Icons.phone, 'Teléfono', proveedor.contactoTelefono),
              if (proveedor.contactoCorreo != null && proveedor.contactoCorreo!.isNotEmpty)
                _filaInfo(Icons.email, 'Correo', proveedor.contactoCorreo!),
            ]),

            const SizedBox(height: 24),

            _seccionInfo('Dirección', [
              _filaInfo(Icons.location_on, 'Provincia', proveedor.direccionProvincia),
              _filaInfo(Icons.location_city, 'Ciudad', proveedor.direccionCiudad),
              _filaInfo(Icons.home, 'Detalle', proveedor.direccionDetalle),
            ]),

            const SizedBox(height: 24),

            _seccionInfo('Finanzas', [
              _filaInfo(Icons.account_balance_wallet, 'Saldo por pagar', Formateadores.formatearPrecio(proveedor.saldoPorPagar, proveedor.moneda)),
            ]),

            const SizedBox(height: 24),

            if (proveedor.observaciones != null && proveedor.observaciones!.isNotEmpty)
              _seccionInfo('Observaciones', [
                _filaInfo(Icons.note, '', proveedor.observaciones!),
              ]),

            const SizedBox(height: 24),

            _seccionInfo('Fechas', [
              _filaInfo(Icons.calendar_today, 'Creado', Formateadores.formatearFecha(proveedor.fechaCreacion)),
              if (proveedor.fechaActualizacion.isAfter(proveedor.fechaCreacion))
                _filaInfo(Icons.update, 'Actualizado', Formateadores.formatearFecha(proveedor.fechaActualizacion)),
            ]),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmarEliminacionDoble(BuildContext context, WidgetRef ref) async {
    final primera = await Dialogos.confirmarEliminar(
      context: context,
      nombre: proveedor.nombre,
      placa: proveedor.rucCi ?? 'Sin RUC/CI',
    );
    if (primera != true) return;

    final segunda = await Dialogos.confirmar(
      context: context,
      titulo: '¡Confirmación final!',
      contenido: 'Estás a punto de eliminar permanentemente al proveedor "${proveedor.nombre}".\n\nEsta acción no se puede deshacer.',
      textoConfirmar: 'Sí, eliminar permanentemente',
      colorConfirmar: Colors.red.shade700,
    );
    if (segunda != true) return;

    final hayInternet = ref.read(internetConnectionProvider).valueOrNull ?? false;

    try {
      await ref.read(proveedoresControllerProvider.notifier).eliminar(proveedor.idExterno);

      if (hayInternet) {
        MensajesGlobales.exito('Proveedor eliminado correctamente');
      } else {
        MensajesGlobales.advertencia('Proveedor marcado para eliminar. Se sincronizará al recuperar internet.');
      }

      if (context.mounted) {
        Navigator.pop(context);
        ref.read(proveedoresControllerProvider.notifier).cargar();
      }
    } catch (e) {
      MensajesGlobales.error('Error al eliminar el proveedor');
    }
  }

  Future<void> _reactivarProveedor(BuildContext context, WidgetRef ref) async {
    final confirmar = await Dialogos.confirmar(
      context: context,
      titulo: 'Reactivar Proveedor',
      contenido: '¿Estás seguro de reactivar al proveedor "${proveedor.nombre}"?',
      textoConfirmar: 'Reactivar',
      colorConfirmar: Colors.green.shade600,
    );

    if (confirmar != true) return;

    try {
      // Intentamos reactivar
      await ref
          .read(proveedoresControllerProvider.notifier)
          .reactivar(proveedor.idExterno);

      // SI LLEGÓ AQUÍ ES PORQUE HUBO INTERNET Y ÉXITO
      if (context.mounted) {
        Navigator.of(context).pop(); // Solo regresa si funcionó
      }
    } catch (_) {
      // No hacemos nada aquí porque el Controller ya mostró el mensaje de error
      // Al entrar aquí, el Navigator.pop() nunca se ejecuta.
    }
  }

  Widget _seccionInfo(String titulo, List<Widget> filas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
        const Divider(height: 20, thickness: 1, color: Colors.grey),
        ...filas,
      ],
    );
  }

  Widget _filaInfo(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo.shade400, size: 26),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label.isNotEmpty)
                  Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getAvatarColor(ProveedorEntity p) {
    if (!p.activo) return Colors.red.shade700;
    if (p.pendienteSync) return Colors.orange.shade700;
    return Colors.indigo.shade600; // Mismo color que Clientes
  }
}