import 'package:flutter/material.dart';
import 'package:mova/core/resources/colors_manager.dart';
import 'package:mova/core/resources/values_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSignWidget extends StatelessWidget {
  const SocialSignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DoubleManager.d_10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          AuthWidget(authIcon: FontAwesomeIcons.facebook),
          AuthWidget(authIcon: FontAwesomeIcons.google),
          AuthWidget(authIcon: FontAwesomeIcons.apple),
        ],
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  final IconData authIcon;
  const AuthWidget({
    Key? key,
    required this.authIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(DoubleManager.d_12.sp),
      onTap: () {},
      child: Stack(children: [
        Container(
          height: DoubleManager.d_7.h,
          width: DoubleManager.d_18.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DoubleManager.d_12.sp),
            color: ColorsManager.tffBackground,
          ),
          child: Center(
            child: Icon(authIcon),
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
      ]),
    );
  }
}
