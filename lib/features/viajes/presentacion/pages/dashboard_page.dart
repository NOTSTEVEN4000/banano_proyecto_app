import 'package:banano_proyecto_app/core/ui/widgets/avatar_usuario.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rolManager = ref.watch(roleManagerProvider);
    final esAdmin = rolManager.esAdministrador;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(245),
      appBar: AppBar(
        title: const Text(
          'Panel Principal',
          style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -0.5),
        ),
        centerTitle: false, // Alineación moderna a la izquierda
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: AvatarUsuario(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 24),
              
              // Sección de Estadísticas (Ahora es un Row adaptable)
              _buildEstadisticasRapidas(size.width),
              
              const SizedBox(height: 32),
              
              const Text(
                'Gestión y Operaciones',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Grid Responsivo
              _buildGridPrincipal(context, esAdmin, size.width),

              if (esAdmin) ...[
                const SizedBox(height: 32),
                _buildTarjetaAdmin(context),
              ],
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bienvenido de nuevo,",
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      ],
    );
  }

  // Grid Adaptable: Cambia de 2 a 3 o 4 columnas según el ancho
  Widget _buildGridPrincipal(BuildContext context, bool esAdmin, double width) {
    int crossAxisCount = width < 600 ? 2 : (width < 900 ? 3 : 4);

    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.1, // Tarjetas más cuadradas y elegantes
      ),
      children: [
        _DashboardCard(
          icon: Icons.local_shipping_rounded,
          titulo: 'Nuevo Viaje',
          subtitulo: 'Registrar carga',
          color: Colors.orange,
          ruta: '/viajes/nuevo',
        ),
        _DashboardCard(
          icon: Icons.directions_car_filled_rounded,
          titulo: 'Vehículos',
          subtitulo: 'Estado de flota',
          color: Colors.blue,
          ruta: '/vehiculos',
        ),
        _DashboardCard(
          icon: Icons.analytics_rounded,
          titulo: 'Viajes',
          subtitulo: 'Historial completo',
          color: Colors.green,
          ruta: '/viajes',
        ),
        _DashboardCard(
          icon: Icons.storefront_rounded,
          titulo: 'Proveedores',
          subtitulo: 'Haciendas',
          color: Colors.purple,
          ruta: '/proveedores',
        ),
        _DashboardCard(
          icon: Icons.groups_rounded,
          titulo: 'Clientes',
          subtitulo: 'Distribuidores',
          color: Colors.teal,
          ruta: '/clientes',
        ),
        if (esAdmin)
          _DashboardCard(
            icon: Icons.admin_panel_settings_rounded,
            titulo: 'Usuarios',
            subtitulo: 'Control de acceso',
            color: Colors.redAccent,
            ruta: '/usuarios',
          ),
      ],
    );
  }

  Widget _buildEstadisticasRapidas(double width) {
    // Si la pantalla es muy angosta, usamos Wrap para que no desborde
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _StatCard(
          titulo: 'Viajes hoy',
          valor: '12',
          icon: Icons.speed_rounded,
          color: Colors.blue,
          width: width,
        ),
        _StatCard(
          titulo: 'Cajas mes',
          valor: '2,340',
          icon: Icons.inventory_2_outlined,
          color: Colors.orange,
          width: width,
        ),
      ],
    );
  }

  Widget _buildTarjetaAdmin(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade800, Colors.deepPurple.shade500],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        leading: const CircleAvatar(
          backgroundColor: Colors.white24,
          child: Icon(Icons.insights, color: Colors.white),
        ),
        title: const Text(
          'Reportes Avanzados',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          'Visualiza el rendimiento de la flota',
          style: TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white),
        onTap: () {},
      ),
    );
  }
}

// --- COMPONENTES PERSONALIZADOS ---

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final String ruta;
  final Color color;

  const _DashboardCard({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    required this.ruta,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => context.push(ruta),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 32, color: color),
                ),
                const SizedBox(height: 12),
                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitulo,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 26, 26, 26)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icon;
  final Color color;
  final double width;

  const _StatCard({
    required this.titulo,
    required this.valor,
    required this.icon,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Calculamos el ancho para que quepan 2 en teléfonos y más en tablets
    final cardWidth = width < 600 ? (width - 52) / 2 : 200.0;

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(
            valor,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          Text(
            titulo,
            style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 46, 46, 46)),
          ),
        ],
      ),
    );
  }
}