import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  //

  static Future<void> signUpMethod({
    required String email,
    required String password,
  }) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => debugPrint('Account created successfully'));
    } catch (e) {
      debugPrint('Unable to create account : $e');
    }
  }

  static Future<void> signInMethod({
    required String email,
    required String password,
  }) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => debugPrint('User login successfully'));
    } catch (e) {
      debugPrint('Unable to login : $e');
    }
  }

  static Future<void> logOutMethod() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      await auth
          .signOut()
          .then((value) => debugPrint('User log out successfully'));
    } catch (e) {
      debugPrint('Unable to log out : $e');
    }
  }
}
