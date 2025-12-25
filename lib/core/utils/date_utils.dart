import 'package:timezone/timezone.dart' as tz;

DateTime nowEcuador() {
  final location = tz.getLocation('America/Guayaquil');
  return tz.TZDateTime.now(location);
}