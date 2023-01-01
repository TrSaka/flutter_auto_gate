import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  const AuthRepository(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<User?> login(String email, String password, bool rememberMe) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw AuthException("User not found");
      } else if (e.code == "wrong-password") {
        throw AuthException("Wrong Password");
      } else {
        throw AuthException("An error occoured, please try again later.");
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<User?> register(String email, String username, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw AuthException("User not found").toString();
      } else if (e.code == "wrong-password") {
        throw AuthException("Wrong Password").toString();
      } else {
        throw AuthException("An error occoured, please try again later.")
            .toString();
      }
    }
  }
}

class AuthException implements Exception {
  final String error;

  AuthException(this.error);

  @override
  String toString() {
    return error;
  }
}
