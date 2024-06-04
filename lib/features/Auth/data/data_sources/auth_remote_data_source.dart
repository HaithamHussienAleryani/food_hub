abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithGoogle();
  Future<String> signUpWithEmailAndPassword(
      {required String email, required String password});
}
