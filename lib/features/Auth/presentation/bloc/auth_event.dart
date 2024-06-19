part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class AuthSignUpViaGoogle extends AuthEvent {}

final class AuthSignOutUser extends AuthEvent {}

final class AuthGetUserSession extends AuthEvent {}

final class AuthSignUpViaEmailAndPassword extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const AuthSignUpViaEmailAndPassword(
      {required this.email, required this.password, required this.name});
}

final class AuthLoginViaEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginViaEmailAndPassword(
      {required this.email, required this.password});
}
