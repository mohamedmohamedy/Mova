import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/images_path.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../../../core/utils/request_state.dart';

import '../bloc/caching_user_data/caching_user_data_bloc.dart';

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
        BlocProvider.of<CachingUserDataBloc>(context)
            .add(GetCachedUserDataEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CachingUserDataBloc, CachingUserDataState>(
        listener: (context, state) {
          if (state.getCacheUserDataState == RequestState.error) {
            Navigator.of(context).pushReplacementNamed(Routes.socialSignScreenKey);
          }
          if (state.getCacheUserDataState == RequestState.success) {
            Navigator.of(context)
                .pushReplacementNamed(Routes.onBoardingScreenKey);
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
