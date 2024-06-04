import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUpViaGoogle implements UseCase<String, NoParams> {
  final AuthRepository authRepository;
  const UserSignUpViaGoogle(this.authRepository);
  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.signUpWithGoogle();
  }
}
