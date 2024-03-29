import 'package:flutter/material.dart';
import 'package:mova/modules/movies/features/on_boarding/presentation/widgets/slider_texts_and_dots_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/fonts_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';
import 'get_started_button.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            StringsManager.welcomeToMova,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: FontsSize.s25, fontWeight: FontWeight.bold),
          ),
          const SliderTextAndDots(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sp),
            child: const GetStartedButton(),
          )
        ],
      ),
    );
  }
}

