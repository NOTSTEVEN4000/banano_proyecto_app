import 'package:banano_proyecto_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AuthState {
  final bool loading;
  final String? error;
  final bool loggedIn;

  AuthState({required this.loading, required this.loggedIn, this.error});

  AuthState copyWith({bool? loading, bool? loggedIn, String? error}) {
    return AuthState(
      loading: loading ?? this.loading,
      loggedIn: loggedIn ?? this.loggedIn,
      error: error,
    );
  }

  factory AuthState.initial() => AuthState(loading: false, loggedIn: false);
}

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository repo;
  AuthController(this.repo) : super(AuthState.initial());

  Future<void> restore() async {
    final ok = await repo.hasSession();
    state = state.copyWith(loggedIn: ok, error: null);
  }

  Future<void> login(String entrada, String clave) async {
    state = state.copyWith(loading: true, error: null);
    try {
      await repo.login(entrada, clave);
      state = state.copyWith(loading: false, loggedIn: true);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> logout() async {
    await repo.logout();
    state = state.copyWith(loggedIn: false, error: null);
  }
}
