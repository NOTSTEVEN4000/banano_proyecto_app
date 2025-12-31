import 'package:banano_proyecto_app/core/ui/widgets/mostrar_dialogos.dart';
import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:banano_proyecto_app/core/utils/formateadores.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/clientes/presentacion/pages/nuevo_cliente_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetalleClientePage extends ConsumerStatefulWidget {
  final ClienteEntity cliente;

  const DetalleClientePage({super.key, required this.cliente});

  @override
  ConsumerState<DetalleClientePage> createState() => _DetalleClientePageState();
}

class _DetalleClientePageState extends ConsumerState<DetalleClientePage> {
  late ClienteEntity cliente;

  @override
  void initState() {
    super.initState();
    cliente = widget.cliente;
  }

  // Método para recargar el cliente desde la base de datos
  Future<void> _recargarCliente() async {
    try {
      final clientesAsync = ref.read(clientesControllerProvider);
      final clientes = clientesAsync.asData?.value;
      if (clientes == null) throw Exception('No hay datos de clientes');
      final clienteActualizado = clientes.firstWhere(
        (c) => c.idExterno == widget.cliente.idExterno,
      );

      setState(() {
        cliente = clienteActualizado;
      });
    } catch (e) {
      if (mounted) {
        MensajesGlobales.error('No se pudo actualizar la información del cliente');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final roleManager = ref.watch(roleManagerProvider);
    final esAdministrador = roleManager.esAdministrador;
    final puedeEditarEliminar = roleManager.puedeEditar || roleManager.puedeEliminar;
    final estaActivo = cliente.activo;

    return Scaffold(
appBar: AppBar(
  backgroundColor: _getAvatarColor(cliente),
  foregroundColor: Colors.white,
  title: Text(
    cliente.nombre,
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
        tooltip: 'Editar cliente',
        onPressed: () async {
          if (!estaActivo) {
            final confirmar = await Dialogos.confirmar(
              context: context,
              titulo: 'Cliente inactivo',
              contenido: 'Este cliente está inactivo. ¿Deseas editarlo de todos modos?',
              textoConfirmar: 'Sí, editar',
              colorConfirmar: Colors.orange.shade600,
            );
            if (confirmar != true) return;
          }

          final resultado = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => NuevoClientePage(editar: cliente),
            ),
          );

          if (resultado == true) {
            await _recargarCliente();
          }
        },
      ),

    // Botón Eliminar (solo si activo)
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
        tooltip: 'Eliminar cliente',
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
        tooltip: 'Reactivar cliente',
        onPressed: () => _reactivarCliente(context, ref),
      ),

    const SizedBox(width: 8), // Espacio al final
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
                    backgroundColor: _getAvatarColor(cliente),
                    child: Text(
                      cliente.nombre.isNotEmpty ? cliente.nombre[0].toUpperCase() : '?',
                      style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    cliente.nombre,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: getColorPorEstado(cliente.estado),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      cliente.estado,
                      style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (cliente.pendienteSync) ...[
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
              _filaInfo(Icons.badge, 'RUC/CI', cliente.rucCi ?? 'No registrado'),
              _filaInfo(Icons.attach_money, 'Precio por caja', Formateadores.formatearPrecio(cliente.precioActual, cliente.moneda)),
            ]),

            const SizedBox(height: 24),

            _seccionInfo('Contacto', [
              _filaInfo(Icons.person, 'Nombre', cliente.contactoNombre),
              _filaInfo(Icons.phone, 'Teléfono', cliente.contactoTelefono),
              if (cliente.contactoCorreo != null && cliente.contactoCorreo!.isNotEmpty)
                _filaInfo(Icons.email, 'Correo', cliente.contactoCorreo!),
            ]),

            const SizedBox(height: 24),

            _seccionInfo('Dirección', [
              _filaInfo(Icons.location_on, 'Provincia', cliente.direccionProvincia),
              _filaInfo(Icons.location_city, 'Ciudad', cliente.direccionCiudad),
              _filaInfo(Icons.home, 'Detalle', cliente.direccionDetalle),
            ]),

            const SizedBox(height: 24),

            if (cliente.observaciones != null && cliente.observaciones!.isNotEmpty)
              _seccionInfo('Observaciones', [
                _filaInfo(Icons.note, '', cliente.observaciones!),
              ]),

            const SizedBox(height: 24),

            _seccionInfo('Fechas', [
              _filaInfo(Icons.calendar_today, 'Creado', Formateadores.formatearFecha(cliente.fechaCreacion)),
              if (cliente.fechaActualizacion.isAfter(cliente.fechaCreacion))
                _filaInfo(Icons.update, 'Actualizado', Formateadores.formatearFecha(cliente.fechaActualizacion)),
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
    nombre: cliente.nombre,
    placa: cliente.rucCi ?? 'Sin RUC/CI',
  );
  if (primera != true) return;

  final segunda = await Dialogos.confirmar(
    context: context,
    titulo: '¡Confirmación final!',
    contenido: 'Estás a punto de eliminar permanentemente al cliente "${cliente.nombre}".\n\nEsta acción no se puede deshacer.',
    textoConfirmar: 'Sí, eliminar permanentemente',
    colorConfirmar: Colors.red.shade700,
  );
  if (segunda != true) return;

  // Detectar si hay internet
  final hayInternet = ref.read(internetConnectionProvider).valueOrNull ?? false;

  try {
    await ref.read(clientesControllerProvider.notifier).eliminar(cliente.idExterno);

    // Mensaje según conexión
    if (hayInternet) {
      MensajesGlobales.exito('Cliente eliminado correctamente');
    } else {
      MensajesGlobales.advertencia(
        'Cliente eliminado. Se sincronizará cuando tengas internet.',
      );
    }

    // Cerrar pantalla y forzar recarga de la lista
    if (context.mounted) {
      Navigator.pop(context);
      // Forzar recarga completa para que desaparezca de la lista
      ref.read(clientesControllerProvider.notifier).cargar();
    }
  } catch (e) {
    MensajesGlobales.error('Error al eliminar el cliente');
  }
}

  Future<void> _reactivarCliente(BuildContext context, WidgetRef ref) async {
    final confirmar = await Dialogos.confirmar(
      context: context,
      titulo: 'Reactivar Cliente',
      contenido: '¿Estás seguro de reactivar al cliente "${cliente.nombre}"?',
      textoConfirmar: 'Reactivar',
      colorConfirmar: Colors.green.shade600,
    );
    if (confirmar != true) return;
    try {
      await ref.read(clientesControllerProvider.notifier).reactivar(cliente.idExterno);
      // SI LLEGÓ AQUÍ ES PORQUE HUBO INTERNET Y ÉXITO
      if (context.mounted) {
        Navigator.of(context).pop(); // Solo regresa si funcionó
      }
    } catch (_) {
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

  Color _getAvatarColor(ClienteEntity c) {
    if (!c.activo) return Colors.red.shade700;
    if (c.pendienteSync) return Colors.orange.shade700;
    return Colors.indigo.shade600;
  }
}

