import 'package:flutter/material.dart';
import 'package:mova/modules/movies/features/home/presentation/pages/home_movies.dart';
import '../../modules/authentication/presentation/pages/on_boarding_screen.dart';
import '../../modules/authentication/presentation/pages/password_reset_screen.dart';
import '../../modules/authentication/presentation/pages/sign_in_screen.dart';
import '../../modules/authentication/presentation/pages/sign_up_screen.dart';
import '../../modules/authentication/presentation/pages/social_sign_screen.dart';
import '../../modules/authentication/presentation/pages/splash_screen.dart';
import '../../modules/authentication/presentation/pages/verfiy_screen.dart';
import '../../modules/movies/features/on_boarding/presentation/pages/now_playing_movies.dart';
import '../utils/error_screen.dart';


class Routes {
  static const String nowPlayingMoviesScreenKey = '/now-playing-movies'; 
  static const String passwordResetScreenKey = '/password_reset';
  static const String verificationScreenKey = '/verification';
  static const String onBoardingScreenKey = '/on_boarding';
  static const String socialSignScreenKey = '/social-sign'; 
  static const String signInScreenKey = '/sign_in';
  static const String signUpScreenKey = '/sign_up';
  static const String splashScreenKey = '/splash';
  static const String errorScreenKey = '/error';
  static const String homeScreenKey = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      nowPlayingMoviesScreenKey:(context) => const NowPlayingScreen(),
      passwordResetScreenKey: (context) => const PasswordResetScreen(),
      onBoardingScreenKey: (context) => const OnBoardingScreen(),
      socialSignScreenKey: (context) => const SocialSignScreen(),
      verificationScreenKey: (context) => const VerifyScreen(),
      homeScreenKey: (context) => const HomeMoviesScreen(),
      splashScreenKey: (context) => const SplashScreen(),
      signUpScreenKey: (context) => const SignUpScreen(),
      signInScreenKey: (context) => const SignInScreen(),
      errorScreenKey:(context) => const ErrorScreen(),
    };
  }
}
