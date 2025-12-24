import 'package:banano_proyecto_app/di/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:banano_proyecto_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:banano_proyecto_app/core/network/api_errors.dart';

class AuthState {
  final bool loading;
  final String? error;
  final bool loggedIn;

  AuthState({
    required this.loading,
    required this.loggedIn,
    this.error,
  });

  AuthState copyWith({
    bool? loading,
    bool? loggedIn,
    String? error,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      loggedIn: loggedIn ?? this.loggedIn,
      error: error,
    );
  }

  factory AuthState.initial() => AuthState(loading: false, loggedIn: false);
}

class AuthController extends Notifier<AuthState> {
  late final AuthRepository repo;

  @override
  AuthState build() {
    repo = ref.read(authRepositoryProvider);
    return AuthState.initial();
  }

  Future<void> restore() async {
    state = state.copyWith(loading: true);
    try {
      final hasSession = await repo.hasSession();
      if (hasSession) {
        state = state.copyWith(loading: false, loggedIn: true);
        // Forzar refresh de providers que dependen de sesión
        ref.invalidate(currentSessionProvider);
      } else {
        state = state.copyWith(loading: false, loggedIn: false);
      }
    } catch (e) {
      state = state.copyWith(loading: false, loggedIn: false);
    }
  }

  Future<void> login(String entrada, String clave) async {
    state = state.copyWith(loading: true, error: null);
    try {
      await repo.login(entrada, clave);
      state = state.copyWith(loading: false, loggedIn: true);
      ref.invalidate(currentSessionProvider); // Refresh rol
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
    state = state.copyWith(loggedIn: false, error: null);
    ref.invalidate(currentSessionProvider);
  }
}