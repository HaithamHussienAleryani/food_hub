import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUpViaEmailAndPassword
    implements UseCase<String, SignUpViaEmailParams> {
  final AuthRepository authRepository;
  UserSignUpViaEmailAndPassword(this.authRepository);
  @override
  Future<Either<Failure, String>> call(SignUpViaEmailParams params) async {
    return await authRepository.signUpWithEmailAndPassword(
        email: params.email, password: params.password);
  }
}

class SignUpViaEmailParams {
  final String email;
  final String password;

  SignUpViaEmailParams({required this.email, required this.password});
}
