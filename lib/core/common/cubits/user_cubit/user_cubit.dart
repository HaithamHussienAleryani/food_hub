import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  updateUser(User? user) {
    if (user == null) {
      emit(UserInitial());
    } else {
      emit(UserIsLoggedIn(user));
    }
  }
}
