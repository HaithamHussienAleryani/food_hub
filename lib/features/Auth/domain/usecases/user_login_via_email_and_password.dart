import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/Auth/domain/repositories/auth_repository.dart';
import 'package:food_hub/features/Auth/domain/usecases/user_sign_up_via_email_and_password.dart';
import 'package:fpdart/fpdart.dart';

class UserLoginViaEmailAndPassword
    implements UseCase<String, SignUpViaEmailParams> {
  final AuthRepository authRepository;

  UserLoginViaEmailAndPassword(this.authRepository);
  @override
  Future<Either<Failure, String>> call(SignUpViaEmailParams params) async {
    return await authRepository.loginWithEmailAndPassword(
        email: params.email, password: params.password);
  }
}
