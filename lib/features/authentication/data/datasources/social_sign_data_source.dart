import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/facebook_user_model.dart';
import '../models/user_model.dart';

class SocialSignDataSource {
    final fireAuth = FirebaseAuth.instance;
  //_______________________________Sign with facebook__________________________
  Future<UserModel> socialSignWithFacebook() async {
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
  Future<UserModel> socialSignWithGoogle() async {
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

}