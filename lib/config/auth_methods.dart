// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning_app/config/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
    required String name,
    required Uint8List profilePhoto,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          name.isNotEmpty) {
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', profilePhoto, false);

        /*Firebase Cloud database vitra ko collection vitra -> users vanne banako(Document parent path) -> ani user ko euta unique document id deko -> ani tes vitra data input gareko
        */
        await firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'name': name,
          'photoUrl': photoUrl,
        });
        res = "Sucessfully registered";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logIn({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "Sucessfully logged in";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
