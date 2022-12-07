import 'package:flutter/widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../resources/values_manager.dart';
import 'package:sizer/sizer.dart';
import '../resources/colors_manager.dart';

class LoadingIndicatorUtil extends StatelessWidget {
  const LoadingIndicatorUtil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: DoubleManager.d_15.h,
        width: DoubleManager.d_15.w,
        child: const LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [ColorsManager.mainRedColor]),
      ),
    );
  }
}
