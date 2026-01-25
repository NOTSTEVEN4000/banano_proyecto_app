import 'package:banano_proyecto_app/core/ui/widgets/avatar_usuario.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/dashboard/presentacion/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:banano_proyecto_app/core/ui/widgets/avatar_usuario.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initializeDateFormatting('es_ES', null);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final esAdmin = ref.watch(
      roleManagerProvider.select((s) => s.esAdministrador),
    );
    final nombreUsuario = ref
        .watch(currentSessionProvider)
        .when(
          data: (session) => session?.nombreCompleto ?? 'Usuario',
          loading: () => 'Cargando...',
          error: (_, __) => 'Usuario',
        );

    return Scaffold(
      backgroundColor: colorScheme.surface,
      // IMPLEMENTACIÓN DEL PULL TO REFRESH
      body: RefreshIndicator(
        onRefresh: () async {
          // Esto limpia el caché y vuelve a pedir los datos a la BD/API
          ref.invalidate(dashboardStatsProvider);
          return await ref.read(dashboardStatsProvider.future);
        },
        child: CustomScrollView(
          // AlwaysScrollable es clave para que el refresh funcione aunque no haya mucho contenido
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            SliverAppBar(
              expandedHeight: 120.0,
              floating: false,
              pinned: true,
              elevation: 0,
              backgroundColor: colorScheme.surface,
              surfaceTintColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsetsDirectional.only(
                  start: 20,
                  bottom: 16,
                ),
                centerTitle: false,
                title: Text(
                  'Panel Principal',
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: AvatarUsuario(),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(colorScheme, nombreUsuario),
                    const SizedBox(height: 24),
                    const _EstadisticasRapidasSection(),
                    const SizedBox(height: 32),
                    Text(
                      'Gestión y Operaciones',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: _GridPrincipalSliver(esAdmin: esAdmin),
            ),
            if (esAdmin)
              const SliverPadding(
                padding: EdgeInsets.all(20),
                sliver: SliverToBoxAdapter(child: _TarjetaAdmin()),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme, String nombre) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bienvenido de nuevo,",
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
                fontSize: 15,
              ),
            ),
            Text(
              nombre,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                size: 14,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                DateFormat('d MMM', 'es').format(DateTime.now()),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --- COMPONENTES ---

class _EstadisticasRapidasSection extends ConsumerWidget {
  const _EstadisticasRapidasSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchamos el provider con autoDispose
    final statsAsync = ref.watch(dashboardStatsProvider);

    return statsAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Center(
        child: Text(
          'Error: Verifica tu conexión',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      ),
      data: (stats) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  titulo: 'Viajes Hoy',
                  valor: '${stats.viajesHoy}',
                  icon: Icons.local_shipping,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  titulo: 'Cajas Mes',
                  valor: NumberFormat('#,###').format(stats.cajasMes),
                  icon: Icons.inventory_2,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  titulo: 'Pago Prov.',
                  valor: '\$${stats.porPagar.toStringAsFixed(2)}',
                  icon: Icons.account_balance_wallet,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  titulo: 'Cobro Clie.',
                  valor: '\$${stats.porCobrar.toStringAsFixed(2)}',
                  icon: Icons.monetization_on,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GridPrincipalSliver extends StatelessWidget {
  final bool esAdmin;
  const _GridPrincipalSliver({required this.esAdmin});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = width < 600 ? 2 : 3;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildListDelegate([
        const _MenuCard(
          icon: Icons.local_shipping_rounded,
          titulo: 'Nuevo Viaje',
          subtitulo: 'Registrar carga',
          color: Colors.orange,
          ruta: '/viajes/nuevo',
        ),
        const _MenuCard(
          icon: Icons.directions_car_filled_rounded,
          titulo: 'Vehículos',
          subtitulo: 'Estado de flota',
          color: Colors.blue,
          ruta: '/vehiculos',
        ),
        const _MenuCard(
          icon: Icons.analytics_rounded,
          titulo: 'Viajes',
          subtitulo: 'Historial completo',
          color: Colors.green,
          ruta: '/viajes',
        ),
        const _MenuCard(
          icon: Icons.storefront_rounded,
          titulo: 'Proveedores',
          subtitulo: 'Haciendas',
          color: Colors.purple,
          ruta: '/proveedores',
        ),
        const _MenuCard(
          icon: Icons.groups_rounded,
          titulo: 'Clientes',
          subtitulo: 'Distribuidores',
          color: Colors.teal,
          ruta: '/clientes',
        ),
        if (esAdmin)
          const _MenuCard(
            icon: Icons.admin_panel_settings_rounded,
            titulo: 'Usuarios',
            subtitulo: 'Control de acceso',
            color: Colors.redAccent,
            ruta: '/usuarios',
          ),
      ]),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color;
  final String ruta;

  const _MenuCard({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    required this.color,
    required this.ruta,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.2)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => context.push(ruta),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 26, color: color),
                ),
                const SizedBox(height: 12),
                Text(
                  titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  subtitulo,
                  style: TextStyle(
                    fontSize: 11,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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

  const _StatCard({
    required this.titulo,
    required this.valor,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            valor,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: colorScheme.onSurface,
            ),
          ),
          Text(
            titulo,
            style: TextStyle(fontSize: 13, color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _TarjetaAdmin extends StatelessWidget {
  const _TarjetaAdmin();
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade800, Colors.deepPurple.shade500],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          onTap: () {},
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
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
        ),
      ),
    );
  }
}
