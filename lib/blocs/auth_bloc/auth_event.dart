part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthSingInEmailEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSingInEmailEvent({required this.email, required this.password});
}

class AuthSingInEvent extends AuthEvent {
  AuthSingInEvent();
}

class AuthRegistrationEmailEvent extends AuthEvent {
  final String email;
  final String password;

  AuthRegistrationEmailEvent({required this.email, required this.password});
}

class AuthRegistrationPhoneEvent extends AuthEvent {
  final String phoneNumber;
  final String password;

  AuthRegistrationPhoneEvent({required this.phoneNumber, required this.password});
}

class AuthSingInPhoneEvent extends AuthEvent {
  final String phoneNumber;

  AuthSingInPhoneEvent({required this.phoneNumber});
}

class AuthUpdateProfileEvent extends AuthEvent {
  final String? phoneNumber;
  final String? displayName;
  final String? photoURL;
  final String? email;
  final String? password;

  AuthUpdateProfileEvent({
     this.displayName,
     this.photoURL,
     this.email,
     this.password,
     this.phoneNumber,
  });
}

class AuthLogOutEvent extends AuthEvent {}
