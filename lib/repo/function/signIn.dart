import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/authentication_services.dart';

class SignIn_Function {
  final AuthenticationServices _auth = AuthenticationServices();
  final auth = FirebaseAuth.instance;
  late User user;

  Future<int> logInWithEmailAndPassword(String email, String password) async {
    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
    if(result != null) {
      user = auth.currentUser!;
      String user_id = await user.uid.toString();
      if(user_id == "t1rfY6046KaZ5sDTZwlKgeyr5Cu2") { // tried to find admin with its uid
        return 0; //sign in with admin account
      }
      else {
        return 1; //sign in with user account
      }
    }
    return -1; //failed sign in
  }

  Future<bool> logInWithGoogle() async {
    dynamic result = await _auth.signInWithGoogle();
    if(result != null) {
      return true;
    }
    return false;
  }
}