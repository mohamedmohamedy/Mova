import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/resources/images_path.dart';
import 'package:mova/core/resources/routes.dart';
import 'package:mova/core/utils/loading_indicator_util.dart';
import 'package:mova/core/utils/request_state.dart';
import 'package:mova/features/authentication/presentation/bloc/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((_) =>
        BlocProvider.of<AuthenticationBloc>(context)
            .add(GetCachedUserDataEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state.getCacheUserDataState == RequestState.error) {
            Navigator.of(context).pushReplacementNamed(Routes.signUpScreenKey);
          }
          if (state.getCacheUserDataState == RequestState.success) {
            Navigator.of(context).pushReplacementNamed(Routes.onBoardingScreenKey);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(
                child: Image(
              image: AssetImage(ImagesPath.logoPath),
              height: 200,
              width: 200,
            )),
            SizedBox(height: 50),
            LoadingIndicatorUtil(),
          ],
        ),
      ),
    );
  }
}
