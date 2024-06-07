import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract interface class AuthRemoteDataSource {
  User? get user;
  Future<User?> signUpWithGoogle();
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password, required String name});
  Future<User?> loginWithEmailAndPassword(
      {required String email, required String password});
  Future<User?> getUserSession();
  Future<void> getUserDocument({required User? user});
  Future<void> setUserDocument({
    required User? user,
    required String email,
    required String name,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.fireStore);

  @override
  User? get user => firebaseAuth.currentUser;

  @override
  Future<User?> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await setUserDocument(user: credential.user, email: email, name: name);

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
    } on ServerException catch (e) {
      throw ServerException(e.message);
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
      setUserDocument(
          user: user.user,
          email: user.user!.email ?? "test@test.com",
          name: user.user!.displayName ?? "testName");
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
    try {
      await getUserDocument(user: user);
      return user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> getUserDocument({required User? user}) async {
    try {
      if (user == null) {
        throw const ServerException("User is not found");
      }
      CollectionReference users = fireStore.collection('users');
      final userInfo = await users.doc(user.uid).get();
      debugPrint("User fetched data is ${userInfo.data()}");
    } on ServerException catch (e) {
      debugPrint(e.message);
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> setUserDocument(
      {required User? user,
      required String email,
      required String name}) async {
    try {
      if (user == null) {
        throw const ServerException("User is not found");
      }
      CollectionReference users = fireStore.collection('users');
      users
          .doc(user.uid)
          .set({
            "name": name,
            "email": email,
            "created_at": DateTime.now().toIso8601String(),
          })
          .then((value) => debugPrint('user added'))
          .catchError((error) => debugPrint('Error adding user $error'));
    } on ServerException catch (e) {
      debugPrint(e.message);
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
