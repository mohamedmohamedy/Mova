import 'package:flutter/material.dart';
import 'package:mova/core/resources/values_manager.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/resources/images_path.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/loading_indicator_util.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: IntManager.i_6)).then(
      (_) => Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.nowPlayingMoviesScreenKey,
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}
