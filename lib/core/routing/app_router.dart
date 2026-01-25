import 'package:banano_proyecto_app/core/ui/widgets/splash_screen.dart';
import 'package:banano_proyecto_app/di/providers.dart';
import 'package:banano_proyecto_app/features/auth/presentacion/pages/login_page.dart';
import 'package:banano_proyecto_app/features/clientes/presentacion/pages/clientes_page.dart';
import 'package:banano_proyecto_app/features/proveedores/presentacion/pages/proveedores_page.dart';
import 'package:banano_proyecto_app/features/vehiculos/presentacion/pages/vehiculos_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/crear_viaje_page.dart';
import 'package:banano_proyecto_app/features/dashboard/presentacion/page/dashboard_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/viaje_detalle_page.dart';
import 'package:banano_proyecto_app/features/viajes/presentacion/pages/viajes.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  // 1. Notifier para cambios de sesión
  final authNotifier = ValueNotifier<bool>(false);
  final routerNotifier = RouterNotifier(ref);
  // 2. Escuchamos solo el cambio de loggedIn
  ref.listen<bool>(authControllerProvider.select((s) => s.loggedIn), (_, next) {
    authNotifier.value = next;
  });

  return GoRouter(
    // CAMBIO CLAVE: Iniciamos en la raíz para que el redirect decida
    initialLocation: '/',
    refreshListenable: routerNotifier, // Escucha cambios de AuthState

    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);

      // SOLO mostramos el cargando si realmente la app está arrancando por primera vez
      if (authState.isInitializing) return null;

      final isLoggedIn = authState.loggedIn;
      final isGoingToLogin = state.matchedLocation == '/login';

      // Si NO está logueado
      if (!isLoggedIn) {
        // Si ya está en el login, no hacemos nada
        if (isGoingToLogin) return null;
        // Si no está en el login, lo mandamos para allá
        return '/login';
      }

      // Si SÍ está logueado pero intenta entrar a login o splash
      if (isLoggedIn && (isGoingToLogin || state.matchedLocation == '/')) {
        return '/dashboard';
      }

      return null;
    },

    routes: [
      // PANTALLA DE CARGA INICIAL (Evita ver el Login un segundo)
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),

      GoRoute(path: '/dashboard', builder: (_, __) => const DashboardPage()),

      // Rutas de VIAJES
      GoRoute(
        path: '/viajes',
        builder: (_, __) => const ViajesPage(),
        routes: [
          GoRoute(path: 'nuevo', builder: (_, __) => const CrearViajePage()),
          GoRoute(
            path: 'detalle/:idExterno',
            builder: (context, state) {
              final idExterno = state.pathParameters['idExterno']!;
              return ViajeDetallePage(idExterno: idExterno);
            },
          ),
        ],
      ),

      // Rutas adicionales
      GoRoute(path: '/vehiculos', builder: (_, __) => const VehiculosPage()),
      GoRoute(path: '/clientes', builder: (_, __) => const ClientesPage()),
      GoRoute(
        path: '/proveedores',
        builder: (_, __) => const ProveedoresPage(),
      ),
    ],

    // Manejo de errores de ruta
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
});

/// Clase auxiliar que convierte el estado de Riverpod en un Listenable para GoRouter
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  RouterNotifier(this._ref) {
    _ref.listen(authControllerProvider, (_, __) => notifyListeners());
  }
}
