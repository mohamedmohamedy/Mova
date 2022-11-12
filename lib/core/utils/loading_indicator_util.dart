import 'package:flutter/widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:mova/core/resources/values_manager.dart';

import '../resources/colors_manager.dart';

class LoadingIndicatorUtil extends StatelessWidget {
  const LoadingIndicatorUtil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: DoubleManager.d_70,
        width: DoubleManager.d_70,
        child: LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [ColorsManager.mainRedColor]),
      ),
    );
  }
}
