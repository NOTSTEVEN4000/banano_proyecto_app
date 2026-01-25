import 'package:banano_proyecto_app/core/ui/widgets/mostrar_dialogos.dart';
import 'package:banano_proyecto_app/core/utils/estado_colores.dart';
import 'package:banano_proyecto_app/core/utils/formateadores.dart';
import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/clientes/data/models/cliente_entity.dart';
import 'package:banano_proyecto_app/features/clientes/presentacion/pages/nuevo_cliente_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetalleClientePage extends ConsumerWidget {
  final ClienteEntity clienteInicial;

  const DetalleClientePage({super.key, required this.clienteInicial});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Cliente actualizado desde el estado global
    final cliente = ref.watch(clientesControllerProvider.select((state) => state.when(
          data: (list) => list.firstWhere(
            (c) => c.idExterno == clienteInicial.idExterno,
            orElse: () => clienteInicial,
          ),
          loading: () => clienteInicial,
          error: (_, __) => clienteInicial,
        )));

    final roleManager = ref.watch(roleManagerProvider);
    final esAdministrador = roleManager.esAdministrador;
    final puedeEditarEliminar = roleManager.puedeEditar || roleManager.puedeEliminar;
    final estaActivo = cliente.activo;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        actions: const [SizedBox(width: 56)], // Espacio para FAB
      ),
      floatingActionButton: _buildFab(context, ref, cliente, puedeEditarEliminar, estaActivo, esAdministrador),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader(context, cliente, colorScheme, textTheme)),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSection('Información básica', colorScheme, [
                  _infoRow(Icons.badge_outlined, 'RUC/CI', cliente.rucCi ?? 'No registrado'),
                  _infoRow(Icons.attach_money, 'Precio por caja', Formateadores.formatearPrecio(cliente.precioActual, cliente.moneda)),
                ]),
                const SizedBox(height: 24),
                _buildSection('Contacto', colorScheme, [
                  _infoRow(Icons.person_outline, 'Nombre', cliente.contactoNombre),
                  _infoRow(Icons.phone_outlined, 'Teléfono', cliente.contactoTelefono),
                  if (cliente.contactoCorreo?.isNotEmpty == true)
                    _infoRow(Icons.email_outlined, 'Correo', cliente.contactoCorreo!),
                ]),
                const SizedBox(height: 24),
                _buildSection('Dirección', colorScheme, [
                  _infoRow(Icons.location_on_outlined, 'Provincia', cliente.direccionProvincia),
                  _infoRow(Icons.location_city_outlined, 'Ciudad', cliente.direccionCiudad),
                  _infoRow(Icons.home_outlined, 'Detalle', cliente.direccionDetalle),
                ]),
                if (cliente.observaciones?.isNotEmpty == true) ...[
                  const SizedBox(height: 24),
                  _buildSection('Observaciones', colorScheme, [
                    _infoRow(Icons.note_outlined, '', cliente.observaciones!),
                  ]),
                ],
                const SizedBox(height: 24),
                _buildSection('Fechas', colorScheme, [
                  _infoRow(Icons.calendar_today_outlined, 'Creado', Formateadores.formatearFecha(cliente.fechaCreacion)),
                  if (cliente.fechaActualizacion.isAfter(cliente.fechaCreacion))
                    _infoRow(Icons.update_outlined, 'Actualizado', Formateadores.formatearFecha(cliente.fechaActualizacion)),
                ]),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // FAB Material 3 nativo con menú BottomSheet
  Widget _buildFab(BuildContext context, WidgetRef ref, ClienteEntity cliente, bool puedeEditarEliminar, bool estaActivo, bool esAdministrador) {
    return FloatingActionButton(
      onPressed: () => _mostrarMenuAcciones(context, ref, cliente, puedeEditarEliminar, estaActivo, esAdministrador),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      elevation: 6,
      shape: const StadiumBorder(),
      child: const Icon(Icons.more_vert, size: 28),
    );
  }

  void _mostrarMenuAcciones(
  BuildContext scaffoldContext, // ← Este es el context del Scaffold (válido siempre)
  WidgetRef ref,
  ClienteEntity cliente,
  bool puedeEditarEliminar,
  bool estaActivo,
  bool esAdministrador,
) {
  showModalBottomSheet(
    context: scaffoldContext,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    backgroundColor: Theme.of(scaffoldContext).colorScheme.surface,
    builder: (bottomSheetContext) => SafeArea( // ← Este context es del BottomSheet
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle M3
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          if (puedeEditarEliminar)
            ListTile(
              leading: Icon(Icons.edit, color: Theme.of(scaffoldContext).colorScheme.primary),
              title: const Text('Editar cliente'),
              onTap: () async {
                Navigator.pop(bottomSheetContext); // Cerramos el BottomSheet
                if (!estaActivo) {
                  final ok = await Dialogos.confirmar(
                    context: scaffoldContext, // ← Usamos el context válido
                    titulo: 'Cliente inactivo',
                    contenido: '¿Editar de todos modos?',
                    textoConfirmar: 'Editar',
                    colorConfirmar: Colors.orange.shade600,
                  );
                  if (!ok!) return;
                }
                final result = await Navigator.push<bool>(
                  scaffoldContext,
                  MaterialPageRoute(builder: (_) => NuevoClientePage(editar: cliente)),
                );
                if (result == true) {
                  ref.read(clientesControllerProvider.notifier).cargar();
                }
              },
            ),
          if (puedeEditarEliminar && estaActivo)
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Eliminar cliente', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(bottomSheetContext);
                _confirmarEliminacionDoble(scaffoldContext, ref, cliente); // ← context válido
              },
            ),
          if (esAdministrador && !estaActivo)
            ListTile(
              leading: const Icon(Icons.restore, color: Colors.green),
              title: const Text('Reactivar cliente', style: TextStyle(color: Colors.green)),
              onTap: () {
                Navigator.pop(bottomSheetContext);
                _reactivarCliente(scaffoldContext, ref, cliente);
              },
            ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}

  Widget _buildHeader(BuildContext context, ClienteEntity cliente, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 60, 20, 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _getAvatarColor(cliente),
            _getAvatarColor(cliente).withValues(alpha: 0.8),
          ],
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white.withValues(alpha: 0.2),
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              child: Text(
                cliente.nombre.isNotEmpty ? cliente.nombre[0].toUpperCase() : '?',
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: _getAvatarColor(cliente)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            cliente.nombre,
            style: textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  cliente.estado,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              if (cliente.pendienteSync) ...[
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(color: Colors.orange.shade600, borderRadius: BorderRadius.circular(20)),
                  child: const Row(children: [
                    Icon(Icons.cloud_upload, size: 16, color: Colors.white),
                    SizedBox(width: 6),
                    Text('Pendiente', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                  ]),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, ColorScheme colorScheme, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorScheme.primary)),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          color: colorScheme.surfaceContainer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(padding: const EdgeInsets.all(16), child: Column(children: children)),
        ),
      ],
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo.shade600, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label.isNotEmpty) Text(label, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmarEliminacionDoble(BuildContext context, WidgetRef ref, ClienteEntity cliente) async {
    final primera = await Dialogos.confirmarEliminarCliente(context: context, nombre: cliente.nombre, ruc: cliente.rucCi ?? 'Sin RUC');
    if (primera == null || !primera) return;

    final segunda = await Dialogos.confirmar(
      context: context,
      titulo: 'Confirmación final',
      contenido: 'Eliminar permanentemente a "${cliente.nombre}"?',
      textoConfirmar: 'Eliminar',
      colorConfirmar: Colors.red.shade700,
    );
    if (!segunda!) return;

    await ref.read(clientesControllerProvider.notifier).eliminar(cliente.idExterno);
    MensajesGlobales.exito('Cliente eliminado');
    if (context.mounted) Navigator.pop(context);
  }

  Future<void> _reactivarCliente(BuildContext context, WidgetRef ref, ClienteEntity cliente) async {
    final ok = await Dialogos.confirmar(
      context: context,
      titulo: 'Reactivar cliente',
      contenido: '¿Reactivar a "${cliente.nombre}"?',
      textoConfirmar: 'Reactivar',
      colorConfirmar: Colors.green.shade600,
    );
    if (!ok!) return;

    await ref.read(clientesControllerProvider.notifier).reactivar(cliente.idExterno);
    MensajesGlobales.exito('Cliente reactivado');
  }

  Color _getAvatarColor(ClienteEntity c) {
    if (!c.activo) return Colors.red.shade700;
    if (c.pendienteSync) return Colors.orange.shade700;
    return Colors.indigo.shade600;
  }
}