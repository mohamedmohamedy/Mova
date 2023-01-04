import 'package:flutter/material.dart';
import '../../../../../../core/resources/values_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/images_path.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesPath.logoPath,
      width: DoubleManager.d_100.w,
      height: DoubleManager.d_18.h,
    );
  }
}
