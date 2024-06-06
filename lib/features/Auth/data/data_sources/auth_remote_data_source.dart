import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract interface class AuthRemoteDataSource {
  User? get user;
  Future<User?> signUpWithGoogle();
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<User?> loginWithEmailAndPassword(
      {required String email, required String password});
  Future<User?> getUserSession();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl(this.firebaseAuth);

  @override
  User? get user => firebaseAuth.currentUser;

  @override
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      if (user == null) {
        throw const ServerException("User is not found");
      }

      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      debugPrint(credential.user!.email);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw const ServerException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw const ServerException(
            'The account already exists for that email.');
      } else {
        throw ServerException(e.message ?? "Error in auth");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User?> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var user = await firebaseAuth.signInWithCredential(credential);

      return user.user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User?> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      if (user == null) {
        throw const ServerException("User is not found");
      }

      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? "Firebase Error");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User?> getUserSession() async {
    return user;
  }
}
