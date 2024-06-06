import 'package:bloc/bloc.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_login_via_email_and_password.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_up_via_email_and_password.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_up_via_google.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpViaGoogle _userSignUpViaGoogle;
  final UserSignUpViaEmailAndPassword _userSignUpViaEmailAndPassword;
  final UserLoginViaEmailAndPassword _userLoginViaEmailAndPassword;
  AuthBloc(
      {required UserSignUpViaGoogle userSignUpViaGoogle,
      required UserSignUpViaEmailAndPassword userSignupUsingViaEmailAndPassword,
      required UserLoginViaEmailAndPassword userLoginViaEmailAndPassword})
      : _userSignUpViaGoogle = userSignUpViaGoogle,
        _userSignUpViaEmailAndPassword = userSignupUsingViaEmailAndPassword,
        _userLoginViaEmailAndPassword = userLoginViaEmailAndPassword,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) => {});
    on<AuthSignUpViaGoogle>(signUpWithGoogleEvent);
    on<AuthSignUpViaEmailAndPassword>(signUpViaEmailAndPassword);
    on<AuthLoginViaEmailAndPassword>(loginViaEmailAndPassword);
  }

  void signUpViaEmailAndPassword(
      AuthSignUpViaEmailAndPassword event, Emitter emit) async {
    emit(AuthLoadingViaEmail());
    final response = await _userSignUpViaEmailAndPassword(
        SignUpViaEmailParams(email: event.email, password: event.password));
    response.fold((failure) => {emit(AuthFailed(failure.message))},
        (user) => {emit(AuthSuccess(user))});
  }

  void loginViaEmailAndPassword(
      AuthLoginViaEmailAndPassword event, Emitter emit) async {
    emit(AuthLoadingViaEmailLogin());
    final response = await _userLoginViaEmailAndPassword(
        SignUpViaEmailParams(email: event.email, password: event.password));
    response.fold((failure) => {emit(AuthFailed(failure.message))},
        (user) => {emit(AuthSuccess(user))});
  }

  void signUpWithGoogleEvent(AuthEvent event, Emitter emit) async {
    emit(AuthLoadingViaGoogle());
    final response = await _userSignUpViaGoogle(NoParams());
    response.fold((failure) => {emit(AuthFailed(failure.message))},
        (user) => {emit(AuthSuccess(user))});
  }
}
