import 'dart:async';

import 'package:dartz/dartz.dart';
import '../../../../core/utils/request_state.dart';
import 'firebase_sign_data_source.dart';
import 'phone_number_sign_data_source.dart.dart';
import 'social_sign_data_source.dart';
import '../models/user_model.dart';

abstract class BaseAuthenticationRemoteDataSource {
  Future<PhoneAuthState> signWithPhoneNumber(String phoneNumber);
  Future<Unit> resetPassword(String email);
  Future<UserModel> signWithFacebook();
  Future<Unit> otpVerify(String code);
  Future<Unit> signIn(UserModel user);
  Future<Unit> signUp(UserModel user);
  Future<UserModel> signWithGoogle();
  Future<bool> verifyUser();
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

  @override
  Future<Unit> resetPassword(String email) => firebaseResetPassword(email);
}
