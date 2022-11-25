import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/bloc_observer.dart';
import 'package:mova/core/resources/routes.dart';
import 'package:mova/core/resources/theme_manager.dart';
import 'package:mova/features/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';
import 'package:mova/features/authentication/presentation/pages/splash_screen.dart';
import 'dependency_container.dart' as di;
import 'package:sizer/sizer.dart';

import 'features/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';
import 'features/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthenticationBloc>()),
        BlocProvider(create: (_) => di.sl<CachingUserDataBloc>()),
        BlocProvider(create: (_) => di.sl<SocialSignBloc>()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mova',
          themeMode: ThemeMode.dark,
          // theme: ThemeData.dark(),
          darkTheme: getApplicationDarkTheme(),
          home: const SplashScreen(),
          routes: Routes.routes,
        ),
      ),
    );
  }
}