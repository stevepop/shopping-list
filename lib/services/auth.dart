import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // return the Future with firebase user object FirebaseUser if one exists
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }

  // Login user
  Future<AuthResult> loginUser({String email, String password}) async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // since something changed, let's notify the listeners...
      notifyListeners();
      return result;
    } catch (e) {
      // throw the Firebase AuthException that we caught
      throw new AuthException(e.code, e.message);
    }
  }
}
