import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../bloc/authentication_bloc.dart';

class SocialSignComponent extends StatelessWidget {
  final IconData authIcon;
  final AuthenticationEvent signEvent;
  const SocialSignComponent({
    Key? key,
    required this.authIcon,
    required this.signEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(DoubleManager.d_12.sp),
      onTap: () => BlocProvider.of<AuthenticationBloc>(context).add(signEvent),
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
