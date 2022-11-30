import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class FireBaseSignDataSource {
  final _fireAuth = FirebaseAuth.instance;
//_________________ Sign in_____________________________________
  Future<Unit> firebaseSignIn(UserModel user) async {
    await _fireAuth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
    return Future.value(unit);
  }

//_________________ Sign up_____________________________________
  Future<Unit> firebaseSignUp(UserModel user) async {
    await _fireAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    await _fireAuth.currentUser!.sendEmailVerification();
    return Future.value(unit);
  }

//_________________ Sign out_____________________________________
  Future<Unit> firebaseSignOut() async {
    await _fireAuth.signOut();
    return Future.value(unit);
  }

//_________________ verify user___________________________________
  Future<bool> firebaseVerifyUser() async {
    final user = _fireAuth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
