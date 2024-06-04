import 'package:bloc/bloc.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_up_via_google.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpViaGoogle _userSignUpViaGoogle;
  AuthBloc({required UserSignUpViaGoogle userSignUpViaGoogle})
      : _userSignUpViaGoogle = userSignUpViaGoogle,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<AuthSignUpViaGoogle>(signUpWithGoogleEvent);
  }

  void signUpWithGoogleEvent(AuthEvent event, Emitter emit) async {
    final response = await _userSignUpViaGoogle(NoParams());
    response.fold((failure) => {emit(AuthFailed(failure.message))},
        (user) => {AuthSuccess(user)});
  }
}
