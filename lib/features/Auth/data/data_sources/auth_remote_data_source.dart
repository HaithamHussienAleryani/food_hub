import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract interface class AuthRemoteDataSource {
  User? get user;
  Future<String> signUpWithGoogle();
  Future<String> signUpWithEmailAndPassword(
      {required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl(this.firebaseAuth);

  @override
  User? get user => firebaseAuth.currentUser;

  @override
  Future<String> signUpWithEmailAndPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var user = await firebaseAuth.signInWithCredential(credential);

      String userEmail = user.user?.email ?? "";

      debugPrint("User Email is $userEmail");

      return userEmail;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
