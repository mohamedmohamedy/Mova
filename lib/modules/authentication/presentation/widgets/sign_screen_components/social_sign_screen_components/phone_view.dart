import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social_buttons_shared_container.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/resources/values_manager.dart';

class SignScreenPhoneView extends StatelessWidget {
  const SignScreenPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SocialButtonsSharedContainer(
            icon: FontAwesomeIcons.phone, signType: StringsManager.phone),
        ClipRRect(
          borderRadius: BorderRadius.circular(DoubleManager.d_10.sp),
          child: Container(
            height: DoubleManager.d_8.h,
            width: double.infinity,
            color: ColorsManager.gGrey.withOpacity(
              DoubleManager.d_005,
            ),
          ),
        ),
      ],
    );
  }
}
