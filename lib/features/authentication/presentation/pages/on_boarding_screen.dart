import 'package:flutter/material.dart';
import 'package:mova/core/resources/colors_manager.dart';
import 'package:mova/core/resources/fonts_manager.dart';
import 'package:mova/core/resources/images_path.dart';
import 'package:mova/core/resources/values_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/exit_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: DoubleManager.d_10.h),
      child: Column(
        children: [
          Text(
            'You have logged in successfully!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: FontsSize.s20, color: ColorsManager.mainRedColor),
          ),
          Image.asset(ImagesPath.verificationSuccessPath),
          const ExitButton(),
        ],
      ),
    ));
  }
}
