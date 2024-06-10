import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_hub/core/common/cubits/user_cubit/user_cubit.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_get_session.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_login_via_email_and_password.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_up_via_email_and_password.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_up_via_google.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpViaGoogle _userSignUpViaGoogle;
  final UserSignUpViaEmailAndPassword _userSignUpViaEmailAndPassword;
  final UserLoginViaEmailAndPassword _userLoginViaEmailAndPassword;
  final UserCubit _userCubit;
  final UserGetSession _userGetSession;
  AuthBloc({
    required UserSignUpViaGoogle userSignUpViaGoogle,
    required UserSignUpViaEmailAndPassword userSignupUsingViaEmailAndPassword,
    required UserLoginViaEmailAndPassword userLoginViaEmailAndPassword,
    required UserCubit userCubit,
    required UserGetSession userGetSession,
  })  : _userSignUpViaGoogle = userSignUpViaGoogle,
        _userSignUpViaEmailAndPassword = userSignupUsingViaEmailAndPassword,
        _userLoginViaEmailAndPassword = userLoginViaEmailAndPassword,
        _userCubit = userCubit,
        _userGetSession = userGetSession,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) => {});
    on<AuthSignUpViaGoogle>(signUpWithGoogleEvent);
    on<AuthSignUpViaEmailAndPassword>(signUpViaEmailAndPassword);
    on<AuthLoginViaEmailAndPassword>(loginViaEmailAndPassword);
    on<AuthGetUserSession>(getUserSession);
  }

  void getUserSession(AuthGetUserSession event, Emitter emit) async {
    final response = await _userGetSession(NoParams());
    response.fold((failure) => {emit(AuthFailed(failure.message))}, (user) {
      _userCubit.updateUser(user);
      emit(AuthSuccess(user));
    });
  }

  void signUpViaEmailAndPassword(
      AuthSignUpViaEmailAndPassword event, Emitter emit) async {
    emit(AuthLoadingViaEmail());
    final response = await _userSignUpViaEmailAndPassword(SignUpViaEmailParams(
        email: event.email, password: event.password, name: event.name));
    response.fold((failure) => {emit(AuthFailed(failure.message))}, (user) {
      _userCubit.updateUser(user);
      emit(AuthSuccess(user));
    });
  }

  void loginViaEmailAndPassword(
      AuthLoginViaEmailAndPassword event, Emitter emit) async {
    emit(AuthLoadingViaEmailLogin());
    final response = await _userLoginViaEmailAndPassword(SignUpViaEmailParams(
        email: event.email, password: event.password, name: ""));
    response.fold((failure) => {emit(AuthFailed(failure.message))}, (user) {
      _userCubit.updateUser(user);
      emit(AuthSuccess(user));
    });
  }

  void signUpWithGoogleEvent(AuthEvent event, Emitter emit) async {
    emit(AuthLoadingViaGoogle());
    final response = await _userSignUpViaGoogle(NoParams());
    response.fold((failure) => {emit(AuthFailed(failure.message))}, (user) {
      _userCubit.updateUser(user);
      emit(AuthSuccess(user));
    });
  }
}
