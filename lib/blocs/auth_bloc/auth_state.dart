part of 'auth_bloc.dart';

@immutable
class AuthState {
  final MyUser? user;
  final String error;

  const AuthState({
    this.error = '',
    this.user = null,
  });

  AuthState copyWith({
    MyUser? user,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      error: error ?? '',
    );
  }
}