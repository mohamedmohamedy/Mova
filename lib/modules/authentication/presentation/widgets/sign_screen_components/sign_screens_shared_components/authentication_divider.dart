import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

class AuthenticationDivider extends StatelessWidget {
  final String text;
  const AuthenticationDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: DoubleManager.d_1.h),
      child: Row(
        children: [
          const DividerLine(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DoubleManager.d_2.w),
            child: Text(text,
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          const DividerLine(),
        ],
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: ColorsManager.gGrey.withOpacity(DoubleManager.d_02),
        height: DoubleManager.d_02.h,
      ),
    );
  }
}
