import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banano_proyecto_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:banano_proyecto_app/core/network/api_errors.dart';

class AuthState {
  final bool loading;
  final bool
  isInitializing; // <--- Nuevo: para saber si estamos arrancando la app
  final String? error;
  final bool loggedIn;

  AuthState({
    required this.loading,
    required this.isInitializing,
    required this.loggedIn,
    this.error,
  });

  AuthState copyWith({
    bool? loading,
    bool? isInitializing,
    bool? loggedIn,
    String? error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      isInitializing: isInitializing ?? this.isInitializing,
      loggedIn: loggedIn ?? this.loggedIn,
      error: error,
    );
  }

  // Al inicio, isInitializing debe ser TRUE
  factory AuthState.initial() =>
      AuthState(loading: false, isInitializing: true, loggedIn: false);
}

class AuthController extends Notifier<AuthState> {
  late final AuthRepository repo;

  @override
  AuthState build() {
    repo = ref.read(authRepositoryProvider);

    // Disparamos la restauración de sesión apenas se crea el provider
    // Usamos Future.microtask para no interferir con el ciclo de build de Riverpod
    Future.microtask(() => restore());

    return AuthState.initial();
  }

  Future<void> restore() async {
    // No usamos 'loading' aquí, usamos 'isInitializing'
    try {
      final hasSession = await repo.hasSession();
      if (hasSession) {
        // Importante: invalidamos la sesión ANTES de apagar el cargando para que
        // el roleManager ya tenga datos cuando el router redirija.
        ref.invalidate(currentSessionProvider);
        state = state.copyWith(isInitializing: false, loggedIn: true);
      } else {
        state = state.copyWith(isInitializing: false, loggedIn: false);
      }
    } catch (e) {
      state = state.copyWith(isInitializing: false, loggedIn: false);
    }
  }

  // --- El resto de tus métodos (login, logout, etc) permanecen igual ---
  // Pero asegúrate de que usen copyWith(loading: ...) y NO toquen isInitializing

  Future<void> login(String entrada, String clave) async {
    state = state.copyWith(loading: true, error: null);
    try {
      await repo.login(entrada, clave);
      ref.invalidate(currentSessionProvider);
      state = state.copyWith(loading: false, loggedIn: true);
    } catch (e) {
      final apiError = mapError(e);
      state = state.copyWith(
        loading: false,
        error: apiError.detalle != null
            ? '${apiError.mensaje}\n${apiError.detalle}'
            : apiError.mensaje,
      );
    }
  }

  Future<void> logout() async {
    await repo.logout();
    // CLAVE: Al cerrar sesión NO estamos inicializando, simplemente salimos.
    state = AuthState(
      loading: false,
      isInitializing: false, // DEBE SER FALSE
      loggedIn: false,
    );
    ref.invalidate(currentSessionProvider);
  }

  Future<bool> solicitarCodigo(String correo) async {
    state = state.copyWith(loading: true, error: null);
    try {
      await repo.solicitarCodigoRecuperacion(correo);
      state = state.copyWith(loading: false);
      return true; // Para saber en la UI que debemos navegar a la siguiente pantalla
    } catch (e) {
      final apiError = mapError(e);
      state = state.copyWith(loading: false, error: apiError.mensaje);
      return false;
    }
  }

  Future<bool> confirmarNuevaClave(
    String correo,
    String codigo,
    String nueva,
  ) async {
    state = state.copyWith(loading: true, error: null);
    try {
      await repo.restablecerClave(correo, codigo, nueva);
      state = state.copyWith(loading: false);
      return true;
    } catch (e) {
      // Si NestJS lanza BadRequestException, ESTO se ejecuta:
      final apiError = mapError(e);
      state = state.copyWith(loading: false, error: apiError.mensaje);
      return false; // <--- ESTO EVITA EL MENSAJE DE ÉXITO EN LA PÁGINA
    }
  }
}
