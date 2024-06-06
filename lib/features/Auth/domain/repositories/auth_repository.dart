import 'package:food_hub/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithGoogle();
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, String>> loginWithEmailAndPassword(
      {required String email, required String password});
}
