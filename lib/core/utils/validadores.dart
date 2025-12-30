
class Validadores {
  static String? requerido(String? valor, [String mensaje = 'Este campo es requerido']) {
    if (valor == null || valor.trim().isEmpty) return mensaje;
    return null;
  }

  // Número entero positivo (opcional)
  static String? numeroEnteroPositivo(String? valor, [String campo = 'El valor']) {
    if (valor == null || valor.trim().isEmpty) return null;
    final num = int.tryParse(valor.trim());
    if (num == null || num < 0) return '$campo debe ser un número positivo';
    return null;
  }

  // Placa ecuatoriana válida
  // Formatos permitidos en Ecuador (2024):
  // - Particular: 3 letras + guion + 3 o 4 números (ej: ABC-123, ABC-1234)
  // - Comercial: 2 letras + guion + 4 números (ej: AA-1234)
  // - Gubernamental: GXX-123, etc.
  // Pero para simplificar y según lo común en apps: 3 letras + 3-4 números
  static String? placaEcuatoriana(String? valor) {
    if (valor == null || valor.trim().isEmpty) return 'La placa es requerida';

    final placa = valor.trim().toUpperCase().replaceAll(' ', '');

    // Regex para formatos comunes: ABC-123, ABC-1234
    final regex = RegExp(r'^[A-Z]{3}-\d{3,4}$');
    if (!regex.hasMatch(placa)) {
      return 'Formato inválido. Ejemplos válidos:\nABC-123\nABC-1234';
    }

    return null;
  }

  static String? numeroPositivo(String? valor, [String campo = 'El número']) {
    if (valor == null || valor.trim().isEmpty) return null;
    final num = int.tryParse(valor.trim());
    if (num == null || num <= 0) return '$campo debe ser mayor a 0';
    return null;
  }

  static String? anioVehiculo(String? valor) {
    if (valor == null || valor.trim().isEmpty) return null;
    final year = int.tryParse(valor.trim());
    if (year == null || year < 1900 || year > DateTime.now().year + 2) {
      return 'Año inválido (1900 - ${DateTime.now().year + 2})';
    }
    return null;
  }

  static String? kilometraje(String? valor) {
    if (valor == null || valor.trim().isEmpty) return null;
    final km = int.tryParse(valor.trim());
    if (km == null || km < 0) return 'Kilometraje inválido';
    return null;
  }


  ////////////////////////////////////////////////////////////////
  ///
  /// Validadores para clientes
  /// 
  /// //////////////////////////////////////////////////////////////
  
  // Solo letras y espacios (para nombres)
  static String? soloLetras(String? valor, [String campo = 'El campo']) {
    if (valor == null || valor.trim().isEmpty) return null;
    final regex = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$');
    if (!regex.hasMatch(valor.trim())) {
      return '$campo solo debe contener letras y espacios';
    }
    return null;
  }

  // Teléfono ecuatoriano: 10 dígitos (09XXXXXXXX)
  static String? telefonoEcuador(String? valor) {
    if (valor == null || valor.trim().isEmpty) return 'El teléfono es requerido';
    final telefono = valor.trim().replaceAll(RegExp(r'\D'), ''); // Quita todo lo que no sea número
    if (telefono.length != 10) return 'El teléfono debe tener exactamente 10 dígitos';
    if (!telefono.startsWith('09')) return 'El teléfono debe comenzar con 09';
    return null;
  }

  // RUC o Cédula válida (13 dígitos) o vacío
  static String? rucCiValido(String? valor) {
    if (valor == null || valor.trim().isEmpty) return null; // Opcional

    final rucCi = valor.trim().replaceAll(RegExp(r'\D'), ''); // Solo números
    if (rucCi.length != 10 && rucCi.length != 13) {
      return 'RUC debe tener 13 dígitos o Cédula 10 dígitos';
    }
    return null;
  }

  // Precio positivo con máximo 2 decimales
  static String? precioValido(String? valor) {
    if (valor == null || valor.trim().isEmpty) return 'El precio es requerido';
    final precioStr = valor.trim().replaceAll(',', '.');
    final precio = double.tryParse(precioStr);
    if (precio == null || precio <= 0) return 'El precio debe ser mayor a 0';
    if (precioStr.contains('.') && precioStr.split('.')[1].length > 2) {
      return 'Máximo 2 decimales (ej: 1.85)';
    }
    return null;
  }

  // Dirección básica (no vacía)
  static String? direccionValida(String? valor) {
    if (valor == null || valor.trim().isEmpty) return 'La dirección es requerida';
    if (valor.trim().length < 5) return 'Dirección muy corta';
    return null;
  }
}