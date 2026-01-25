import 'package:banano_proyecto_app/core/utils/mensajes_globales.dart';
import 'package:banano_proyecto_app/core/ui/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routing/app_router.dart';
import 'di/providers.dart';


class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    // Restaurar sesión de forma asíncrona pero fuera del build principal
    Future.microtask(() => ref.read(authControllerProvider.notifier).restore());
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    
    // 1. ESCUCHA EL TEMA AQUÍ
    final modoTema = ref.watch(temaProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      
      // 2. CONFIGURA AMBOS TEMAS
      themeMode: modoTema, 
      theme: AppTheme.light(), // Tu tema claro actual
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        // Aquí puedes personalizar el modo oscuro si quieres
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow, 
          brightness: Brightness.dark
        ),
      ),

      routerConfig: router,
      scaffoldMessengerKey: MensajesGlobales.messengerKey,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}