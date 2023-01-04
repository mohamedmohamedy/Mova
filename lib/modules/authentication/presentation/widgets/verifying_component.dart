import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/images_path.dart';
import '../../../../core/utils/top_screen_back_arrow.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/resources/routes.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../bloc/regular_sign/authentication_bloc.dart';

class VerifyingComponent extends StatelessWidget {
  const VerifyingComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      buildWhen: (previous, current) => previous.userState != current.userState,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: DoubleManager.d_5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopScreenBackArrow(
                  navigateFunction: () => Navigator.of(context)
                      .pushReplacementNamed(Routes.signUpScreenKey)),
              Image.asset(ImagesPath.verificationPath),
              Text(
                StringsManager.verifyEmailMessage,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
