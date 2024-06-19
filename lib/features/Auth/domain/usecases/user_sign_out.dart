import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignOut implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  UserSignOut(this.authRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.signOut();
  }
}
