import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/auth/presentacion/controllers/auth_controller.dart';
import 'package:banano_proyecto_app/features/auth/presentacion/pages/login_page.dart';
import 'package:banano_proyecto_app/features/vehiculos/presentacion/vehiculos_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/crear_viaje_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/dashboard_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/viajes.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final refreshNotifier = ValueNotifier<int>(0);

  ref.listen<AuthState>(authControllerProvider, (_, __) {
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
        builder: (_, __) => const LoginPage(),
      ),

      GoRoute(
        path: '/dashboard',
        builder: (_, __) => const DashboardPage(),
      ),

      GoRoute(
        path: '/viajes',
        builder: (_, __) => const ViajesPage(),
      ),

      GoRoute(
        path: '/vehiculos',
        builder: (_, __) => const VehiculosPage(),
      ),

      GoRoute(
        path: '/viajes/nuevo',
        builder: (_, __) => const CrearViajePage(),
      ),
    ],
  );
});
