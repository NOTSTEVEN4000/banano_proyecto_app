import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/auth/presentacion/controllers/auth_controller.dart';
import 'package:banano_proyecto_app/features/auth/presentacion/pages/login_page.dart';
import 'package:banano_proyecto_app/features/clientes/presentacion/pages/clientes_page.dart';
import 'package:banano_proyecto_app/features/proveedores/presentacion/pages/proveedores_page.dart';
import 'package:banano_proyecto_app/features/vehiculos/presentacion/pages/vehiculos_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/crear_viaje_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/dashboard_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/viajes.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = ValueNotifier<int>(0);

  ref.listen<AuthState>(authControllerProvider, (_, _) {
    refreshNotifier.value++;
  });

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: refreshNotifier,

    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      final enLogin = state.matchedLocation == '/login';

      // NO logueado → login
      if (!auth.loggedIn && !enLogin) return '/login';

      // YA logueado → dashboard
      if (auth.loggedIn && enLogin) return '/dashboard';

      return null;
    },

    routes: [
      GoRoute(
        path: '/login',
        builder: (_, _) => const LoginPage(),
      ),

      GoRoute(
        path: '/dashboard',
        builder: (_, _) => const DashboardPage(),
      ),

      GoRoute(
        path: '/viajes',
        builder: (_, _) => const ViajesPage(),
      ),

      GoRoute(
        path: '/vehiculos',
        builder: (_, _) => const VehiculosPage(),
      ),

      GoRoute(
        path: '/clientes',
        builder: (_, _) => const ClientesPage(),
      ),

      GoRoute(
        path: '/proveedores',
        builder: (_, _) => const ProveedoresPage(),
      ),

      GoRoute(
        path: '/viajes/nuevo',
        builder: (_, _) => const CrearViajePage(),
      ),
    ],
  );
});
