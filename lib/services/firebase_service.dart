import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  //

  static Future<void> signUpMethod({
    required String email,
    required String password,
  }) async {
    try {
      final FirebaseAuth authentication = FirebaseAuth.instance;

      await authentication
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
      final FirebaseAuth authentication = FirebaseAuth.instance;

      await authentication
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => debugPrint('User login successfully'));
    } catch (e) {
      debugPrint('Unable to login : $e');
    }
  }

  static Future<void> logOutMethod() async {
    try {
      final FirebaseAuth authentication = FirebaseAuth.instance;

      await authentication
          .signOut()
          .then((value) => debugPrint('User log out successfully'));
    } catch (e) {
      debugPrint('Unable to log out : $e');
    }
  }

  static Future<void> addBioInToFirestoreDB({
    required String bio,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore
          .collection('userBio')
          .doc(DateTime.now().millisecondsSinceEpoch.toString())
          .set({
        'bio': bio,
      }).then((value) => debugPrint('Bio added successfully'));
    } catch (e) {
      debugPrint('Unable to add bio : $e');
    }
  }

  static Future<void> fetchBioFromFirestoreDB() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      DocumentReference userRef = firestore
          .collection('userBio')
          .doc('DateTime.now().millisecondsSinceEpoch.toString()');

      DocumentSnapshot userSnapshot = await userRef.get();

      // Check if the document exists
      if (userSnapshot.exists) {
        String userBio = userSnapshot.get('bio');

        print('User Bio: $userBio');
      } else {
        print('User document does not exist');
      }
    } catch (e) {
      print('Unable to fetch bio : $e');
    }
  }

  static Future<void> updateBioInToFirestoreDB({
    required String newBio,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore
          .collection('userBio')
          .doc('DateTime.now().millisecondsSinceEpoch.toString()')
          .update({
        'bio': newBio,
      }).then((value) => debugPrint('Bio added successfully'));
    } catch (e) {
      debugPrint('Unable to update bio : $e');
    }
  }
}
