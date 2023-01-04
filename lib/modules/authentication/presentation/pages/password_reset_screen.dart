import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../../../core/utils/request_state.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../../../../core/utils/top_screen_back_arrow.dart';
import '../bloc/regular_sign/authentication_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/resources/strings_manager.dart';
import '../widgets/sign_screen_components/reset_password_screen_components/email_and_save.dart';
import '../widgets/sign_screen_components/reset_password_screen_components/enter_email_text.dart';
import '../widgets/sign_screen_components/reset_password_screen_components/reset_image.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) =>
          previous.resetPasswordState != current.resetPasswordState,
      listener: (context, state) {
        if (state.resetPasswordState == RequestState.success) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: const Text(
                        StringsManager.resetPasswordAlertMessage,
                        softWrap: true),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(Routes.signInScreenKey),
                          child: const Text(StringsManager.okay))
                    ],
                  ));
        }
        if (state.resetPasswordState == RequestState.error) {
          SnackBarUtil().getSnackBar(
              context: context,
              message: state.resetPasswordMessage,
              color: ColorsManager.mainRedColor);
        }
      },
      buildWhen: (previous, current) =>
          previous.resetPasswordState != current.resetPasswordState,
      builder: (context, state) {
        if (state.resetPasswordState == RequestState.loading) {
          return const LoadingIndicatorUtil();
        }
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: DoubleManager.d_5.w,
                        vertical: DoubleManager.d_5.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TopScreenBackArrow(
                            navigateFunction: () => Navigator.of(context)
                                .pushReplacementNamed(Routes.signInScreenKey)),
                        const ResetImage(),
                        const EnterEmailText(),
                        EmailAndSaveButton(emailController: emailController),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
