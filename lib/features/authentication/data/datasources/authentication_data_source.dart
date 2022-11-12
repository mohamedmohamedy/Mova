import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mova/features/authentication/data/models/user_model.dart';

abstract class BaseAuthenticationDataSource {
  Future<Unit> signIn(UserModel user);
  Future<Unit> signUp(UserModel user);
  Future<Unit> signOut();
  Future<bool> verifyUser();
}

class AuthenticationDataSource implements BaseAuthenticationDataSource {
  //_______________________________Sign in ___________________________________
  @override
  Future<Unit> signIn(UserModel user) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user.email, password: user.password);
    return Future.value(unit);
  }

  //_______________________________Sign up ___________________________________
  @override
  Future<Unit> signUp(UserModel user) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    return Future.value(unit);
  }

  //_______________________________Sign out ___________________________________
  @override
  Future<Unit> signOut() async {
    await FirebaseAuth.instance.signOut();
    return Future.value(unit);
  }

  //_______________________________Verify User__________________________________
  @override
  Future<bool> verifyUser() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      return true;
    }
    return false;
  }
}
