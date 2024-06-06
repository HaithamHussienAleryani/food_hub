import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_hub/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User?>> signUpWithGoogle();
  Future<Either<Failure, User?>> getUserSession();
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, User?>> loginWithEmailAndPassword(
      {required String email, required String password});
}
