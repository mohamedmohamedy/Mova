import 'package:flutter/material.dart';
import '../resources/images_path.dart';
import '../resources/routes.dart';
import '../resources/values_manager.dart';
import 'top_screen_back_arrow.dart';
import 'package:sizer/sizer.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final errorText = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: TopScreenBackArrow(
          navigateFunction: () => Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.nowPlayingMoviesScreenKey, (route) => false),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(DoubleManager.d_10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagesPath.errorPath,
              height: DoubleManager.d_50.h,
              width: double.infinity,
            ),
            Text(
              errorText,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
