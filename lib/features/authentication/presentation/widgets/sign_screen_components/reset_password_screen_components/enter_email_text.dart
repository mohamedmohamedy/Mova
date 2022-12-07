import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/fonts_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../../../core/resources/values_manager.dart';


class EnterEmailText extends StatelessWidget {
  const EnterEmailText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DoubleManager.d_2.w,
        vertical: DoubleManager.d_2.h,
      ),
      child: Text(StringsManager.sendEmailMessage,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: FontsSize.s14),
          textAlign: TextAlign.center),
    );
  }
}