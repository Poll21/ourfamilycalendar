part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthSingInEmailEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSingInEmailEvent({required this.email, required this.password});
}

class AuthRegistrationEmailEvent extends AuthEvent {
  final String email;
  final String password;

  AuthRegistrationEmailEvent({required this.email, required this.password});
}

class AuthSingInPhoneEvent extends AuthEvent {
  final String phoneNumber;

  AuthSingInPhoneEvent({required this.phoneNumber});
}

class AuthLogOutEvent extends AuthEvent {}