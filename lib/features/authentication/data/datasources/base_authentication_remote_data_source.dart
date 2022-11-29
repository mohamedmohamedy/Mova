import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mova/core/utils/request_state.dart';
import 'package:mova/features/authentication/data/datasources/firebase_sign_data_source.dart';
import 'package:mova/features/authentication/data/datasources/phone_number_sign_data_source.dart.dart';
import 'package:mova/features/authentication/data/datasources/social_sign_data_source.dart';
import 'package:mova/features/authentication/data/models/user_model.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<PhoneAuthState> signWithPhoneNumber(String phoneNumber);
  Future<UserModel> signWithFacebook();
  Future<UserModel> signWithGoogle();
  Future<Unit> signIn(UserModel user);
  Future<Unit> signUp(UserModel user);
  Future<bool> verifyUser();
  Future<Unit> otpVerify(String code);
  Future<Unit> signOut();
}

class AuthenticationRemoteDataSource
    with
        SocialSignDataSource,
        FireBaseSignDataSource,
        PhoneNumberAuthenticationDataSource
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

  @override
  Future<PhoneAuthState> signWithPhoneNumber(String phoneNumber) =>
      socialSignWithPhoneNumber(phoneNumber);

  @override
  Future<Unit> otpVerify(String code) => socialOtpVerification(code);
}
