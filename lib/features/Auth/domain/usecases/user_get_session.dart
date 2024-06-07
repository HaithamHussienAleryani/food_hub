import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/core/usecase/usecase.dart';
import 'package:food_hub/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserGetSession implements UseCase<User?, NoParams> {
  final AuthRepository authRepository;

  UserGetSession(this.authRepository);

  @override
  Future<Either<Failure, User?>> call(NoParams params) async {
    return await authRepository.getUserSession();
  }
}
