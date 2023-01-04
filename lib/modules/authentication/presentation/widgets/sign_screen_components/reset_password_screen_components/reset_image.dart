import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/images_path.dart';
import '../../../../../../core/resources/values_manager.dart';


class ResetImage extends StatelessWidget {
  const ResetImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesPath.forgotPasswordPath,
      fit: BoxFit.cover,
      height: DoubleManager.d_45.h,
      width: DoubleManager.d_100.w,
    );
  }
}
