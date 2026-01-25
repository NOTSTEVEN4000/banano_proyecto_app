import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'app.dart';
import 'core/storage/isar_db.dart';

Future<void> main() async {
  // Aseguramos que la comunicación con el motor nativo esté lista
  final binding = WidgetsFlutterBinding.ensureInitialized();
  
  // Preservar splash si es necesario hasta que Isar esté listo
  // FlutterNativeSplash.preserve(widgetsBinding: binding); 

  final isar = await IsarDb.open();
  tz.initializeTimeZones();

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      // El child es const para que ProviderScope no lo reconstruya
      child: const App(),
      
    ),
  );
}
