
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

class PhoneSignComponentForSignUpScreen extends StatelessWidget {
  const PhoneSignComponentForSignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: DoubleManager.d_7.h,
        width: DoubleManager.d_18.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DoubleManager.d_12.sp),
          color: ColorsManager.tffBackground,
        ),
        child: const Center(
          child: Icon(FontAwesomeIcons.phone),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DoubleManager.d_12.sp),
          color: Colors.white.withOpacity(DoubleManager.d_003),
        ),
        height: DoubleManager.d_7.h,
        width: DoubleManager.d_18.w,
      )
    ]);
  }
}
