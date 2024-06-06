part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserIsLoggedIn extends UserState {
  final User user;
  UserIsLoggedIn(this.user);
}
