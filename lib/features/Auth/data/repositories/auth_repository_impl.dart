import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_hub/core/errors/exceptions.dart';
import 'package:food_hub/core/errors/failures.dart';
import 'package:food_hub/features/Auth/data/data_sources/auth_remote_data_source.dart';
import 'package:food_hub/features/Auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, User?>> signUpWithGoogle() async {
    try {
      return right(await authRemoteDataSource.signUpWithGoogle());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return right(await authRemoteDataSource.signUpWithEmailAndPassword(
          email: email, password: password));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User?>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return right(await authRemoteDataSource.loginWithEmailAndPassword(
          email: email, password: password));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User?>> getUserSession() async {
    try {
      return right(await authRemoteDataSource.getUserSession());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
