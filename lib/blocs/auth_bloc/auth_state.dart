part of 'auth_bloc.dart';

@immutable
class AuthState {
  final User? user;
  final String error;

  const AuthState({
    this.error = '',
    this.user = null,
  });

  AuthState copyWith({
    User? user,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      error: error ?? '',
    );
  }
}
