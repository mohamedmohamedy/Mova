import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mova/features/authentication/data/models/facebook_user_model.dart';
import 'package:mova/features/authentication/data/models/user_model.dart';

abstract class BaseAuthenticationDataSource {
  Future<Unit> signIn(UserModel user);
  Future<Unit> signUp(UserModel user);
  Future<UserModel> signWithFacebook();
  Future<UserModel> signWithGoogle();
  Future<Unit> signOut();
  Future<bool> verifyUser();
}

class AuthenticationDataSource implements BaseAuthenticationDataSource {
  final fireAuth = FirebaseAuth.instance;
  //_______________________________Sign in ___________________________________
  @override
  Future<Unit> signIn(UserModel user) async {
    await fireAuth.signInWithEmailAndPassword(
        email: user.email, password: user.password);
    return Future.value(unit);
  }

  //_______________________________Sign up ___________________________________
  @override
  Future<Unit> signUp(UserModel user) async {
    await fireAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    await fireAuth.currentUser!.sendEmailVerification();
    return Future.value(unit);
  }

  //_______________________________Sign out ___________________________________
  @override
  Future<Unit> signOut() async {
    await fireAuth.signOut();
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
    await fireAuth.signInWithCredential(credential);

    return Future.value(userModel);
  }

  //_______________________________Sign with Google______________________________
  @override
  Future<UserModel> signWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final googleSignInAccount = await googleSignIn.signIn();
    final googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    await fireAuth.signInWithCredential(credential);
    final UserModel user = UserModel(
        email: googleSignInAccount.email, password: googleSignInAccount.id);
    return Future.value(user);
  }

  //_______________________________Verify User__________________________________
  @override
  Future<bool> verifyUser() async {
    final user = fireAuth.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
