import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mova/core/utils/request_state.dart';

class PhoneNumberAuthenticationDataSource {
  final fireAuth = FirebaseAuth.instance;
  String? userVerificationId;

  Future<PhoneAuthState> socialSignWithPhoneNumber(String phoneNumber) async {
  
    late PhoneAuthState phoneAuthState;
  
    fireAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 120),
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        final result = await fireAuth.signInWithCredential(credential);
        final user = result.user;
        if (user != null) {
          phoneAuthState = PhoneAuthState.automatic;
        }
      },
      
      verificationFailed: (error) =>
          throw FirebaseAuthException(code: error.code),

      codeSent: (verificationId, forceResendingToken) async {
        userVerificationId = verificationId;
        phoneAuthState = PhoneAuthState.manual;
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
    return phoneAuthState;
  }

  //__________________________Otp verification_______________________________________
  Future<Unit> socialOtpVerification(String code) async {
    final credential = PhoneAuthProvider.credential(
        verificationId: userVerificationId!, smsCode: code);
    final result = await fireAuth.signInWithCredential(credential);
    final user = result.user;
    if (user != null) {
      return Future.value(unit);
    }
    throw FirebaseAuthException;
  }
}
