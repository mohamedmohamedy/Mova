import 'package:flutter/material.dart';
import 'package:mova/features/authentication/presentation/pages/splash_screen.dart';
import 'package:mova/features/authentication/presentation/pages/verfiy_test_screen.dart';
import 'package:mova/features/authentication/presentation/pages/verifing_screen.dart';

import '../../features/authentication/presentation/pages/on_boarding_screen.dart';
import '../../features/authentication/presentation/pages/sign_up_screen.dart';

class Routes {
  static const String splashScreenKey = '/splash';
  static const String onBoardingScreenKey = '/on_boarding';
  static const String signUpScreenKey = '/sign_up';
  static const String verificationScreenKey = '/verification';

  static Map<String, WidgetBuilder> get routes {
    return {
      splashScreenKey: (context) => const SplashScreen(),
      onBoardingScreenKey: (context) => const OnBoardingScreen(),
      signUpScreenKey: (context) => const SignUpScreen(),
      verificationScreenKey:(context) => const VerifyTestScreen(),
    };
  }
}
