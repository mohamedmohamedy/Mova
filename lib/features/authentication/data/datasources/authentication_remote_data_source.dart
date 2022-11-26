import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mova/features/authentication/data/datasources/firebase_sign_data_source.dart';
import 'package:mova/features/authentication/data/datasources/social_sign_data_source.dart';
import 'package:mova/features/authentication/data/models/user_model.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<Unit> signIn(UserModel user);
  Future<Unit> signUp(UserModel user);
  Future<UserModel> signWithFacebook();
  Future<UserModel> signWithGoogle();
  Future<Unit> signOut();
  Future<bool> verifyUser();
}

class AuthenticationRemoteDataSource
    with SocialSignDataSource, FireBaseSignDataSource
    implements BaseAuthenticationRemoteDataSource {
  
  @override
  Future<UserModel> signWithFacebook() => socialSignWithFacebook();

  @override
  Future<UserModel> signWithGoogle() => socialSignWithGoogle();

  @override
  Future<Unit> signIn(UserModel user) => firebaseSignIn(user);

  @override
  Future<Unit> signOut() => firebaseSignOut();

  @override
  Future<Unit> signUp(UserModel user) => firebaseSignUp(user);

  @override
  Future<bool> verifyUser() => firebaseVerifyUser();
}
