import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_system/core/services/firestore/firestore_service.dart';
import 'package:flutter_system/core/services/realtime/realtime_service.dart';
import 'package:flutter_system/models/user_model.dart';

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
      if (await RealTimeDatabaseRepo()
          .tryToLoginAccount(result.user!.uid, signOut())) {
        return result.user;
      } else {
        print("user limit is full");
      }
      print(result.user!.uid);
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

  Future<User?> register(String name, String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FireStoreService(result.user!.uid,
              user: SimpleUser(email: email, name: name, password: password))
          .saveUserToDatabase();
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

  Future<void> signOut() async {
    await _auth.signOut();
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
