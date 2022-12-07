import 'package:flutter/material.dart';
import '../../features/authentication/presentation/pages/password_reset_screen.dart';
import '../../features/authentication/presentation/pages/splash_screen.dart';
import '../../features/authentication/presentation/pages/verfiy_test_screen.dart';

import '../../features/authentication/presentation/pages/on_boarding_screen.dart';
import '../../features/authentication/presentation/pages/sign_in_screen.dart';
import '../../features/authentication/presentation/pages/sign_up_screen.dart';

class Routes {
  static const String passwordResetScreenKey = '/password_reset';
  static const String verificationScreenKey = '/verification';
  static const String onBoardingScreenKey = '/on_boarding';
  static const String signInScreenKey = '/sign_in';
  static const String signUpScreenKey = '/sign_up';
  static const String splashScreenKey = '/splash';

  static Map<String, WidgetBuilder> get routes {
    return {
      passwordResetScreenKey:(context) => const PasswordResetScreen(),
      verificationScreenKey: (context) => const VerifyTestScreen(),
      onBoardingScreenKey: (context) => const OnBoardingScreen(),
      splashScreenKey: (context) => const SplashScreen(),
      signUpScreenKey: (context) => const SignUpScreen(),
      signInScreenKey:(context) => const SignInScreen()
    };
  }
}
