import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/global/bloc_providers.dart';
import 'bloc_observer.dart';
import 'core/resources/routes.dart';
import 'core/resources/theme_manager.dart';
import 'dependency_container.dart' as di;
import 'package:sizer/sizer.dart';

import 'modules/authentication/presentation/pages/splash_screen.dart';

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
      providers: BlocProviders.blocProviders,
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
