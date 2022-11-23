import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mova/features/authentication/data/models/facebook_user_model.dart';
import 'package:mova/features/authentication/data/models/user_model.dart';

abstract class BaseAuthenticationDataSource {
  Future<Unit> signIn(UserModel user);
  Future<Unit> signUp(UserModel user);
  Future<UserModel> signWithFacebook();
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

  //_______________________________Sign with facebook__________________________
  @override
  Future<UserModel> signWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final Map<String, dynamic> userData =
        await FacebookAuth.instance.getUserData(fields: 'name,email');
    final userDataConverted = FacebookUserModel.fromMap(userData);
    final userModel = UserModel(
      email: userDataConverted.email!,
      password: userDataConverted.name!,
    );

    final OAuthCredential credential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    await FirebaseAuth.instance.signInWithCredential(credential);

    return Future.value(userModel);
  }

  //_______________________________Verify User__________________________________
  @override
  Future<bool> verifyUser() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      return  Future.value(true) ;
    }
    return Future.value(false);
  }
}
