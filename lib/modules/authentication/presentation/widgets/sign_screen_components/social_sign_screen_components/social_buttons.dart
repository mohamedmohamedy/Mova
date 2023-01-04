import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'social_buttons_shared_container.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../bloc/social_sign/social_sign_bloc.dart';

class SocialSignScreenButtons extends StatelessWidget {
  final SocialSignEvent signEvent;
  final IconData icon;
  final String signType;
  const SocialSignScreenButtons({
    Key? key,
    required this.signEvent,
    required this.icon,
    required this.signType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SocialButtonsSharedContainer(icon: icon, signType: signType),
        ClipRRect(
          borderRadius: BorderRadius.circular(DoubleManager.d_10.sp),
          child: InkWell(
            onTap: () =>
                BlocProvider.of<SocialSignBloc>(context).add(signEvent),
            child: Container(
              height: DoubleManager.d_8.h,
              width: double.infinity,
              color: ColorsManager.gGrey.withOpacity(
                DoubleManager.d_005,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

