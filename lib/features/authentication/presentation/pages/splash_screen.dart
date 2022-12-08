import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/resources/values_manager.dart';
import 'package:sizer/sizer.dart';
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
    Future.delayed(const Duration(seconds: IntManager.i_6))
    .then((_) =>
        BlocProvider.of<CachingUserDataBloc>(context)
            .add(GetCachedUserDataEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CachingUserDataBloc, CachingUserDataState>(
        listener: (context, state) {
          if (state.getCacheUserDataState == RequestState.error) {
            Navigator.of(context)
                .pushReplacementNamed(Routes.socialSignScreenKey);
          }
          if (state.getCacheUserDataState == RequestState.success) {
            Navigator.of(context)
                .pushReplacementNamed(Routes.onBoardingScreenKey);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image(
              image: const AssetImage(ImagesPath.logoPath),
              height: DoubleManager.d_50.h,
              width: DoubleManager.d_50.w,
            )),
            const LoadingIndicatorUtil(),
          ],
        ),
      ),
    );
  }
}
