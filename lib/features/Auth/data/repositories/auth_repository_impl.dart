import 'package:food_hub/core/errors/exceptions.dart';
import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/features/Auth/data/data_sources/auth_remote_data_source.dart';
import 'package:food_hub/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> signUpWithGoogle() async {
    try {
      return right(await authRemoteDataSource.signUpWithGoogle());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
