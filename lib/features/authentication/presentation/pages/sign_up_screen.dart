import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/core/resources/values_manager.dart';
import 'package:mova/core/utils/snack_bar_util.dart';
import 'package:mova/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:mova/features/authentication/presentation/widgets/authentication_divider.dart';
import 'package:mova/features/authentication/presentation/widgets/facebook_sign_widget.dart';
import 'package:mova/features/authentication/presentation/widgets/have_account_widget.dart';
import 'package:mova/features/authentication/presentation/widgets/sign_form.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/request_state.dart';
import '../../domain/entities/user.dart';
import '../widgets/main_logo.dart';
import '../widgets/sign_type_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) =>
              previous.signUpState != current.signUpState,
          listener: (context, state) {
            switch (state.signUpState) {
              case RequestState.loading:
                return SnackBarUtil().getSnackBar(
                    context: context, message: 'loading', color: Colors.yellow);
              case RequestState.success:
                {
                  {
                    Navigator.of(context)
                        .pushNamed(Routes.verificationScreenKey);
                    return SnackBarUtil().getSnackBar(
                        context: context,
                        message: 'success',
                        color: Colors.green);
                  }
                }
              case RequestState.error:
                return SnackBarUtil().getSnackBar(
                    context: context,
                    message: state.signUpMessage,
                    color: Colors.red);
              case RequestState.stable:
                SnackBarUtil().getSnackBar(
                    context: context, message: 'stable', color: Colors.orange);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: DoubleManager.d_16),
            child: Column(
              children: [
                const MainLogo(),
                const SignTypeText(signSentence: StringsManager.create),
                SignForm(
                    signEvent: signEvent, buttonText: StringsManager.signUp),
                const Spacer(),
                const AuthenticationDivider(),
                const SocialSignWidget(),
                const HaveAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // this is the function used in the form helping widget that needs an Authentication event.
  SignUpEvent signEvent(String email, String password) {
    return SignUpEvent(
      user: UserEntity(
        email: email,
        password: password,
      ),
    );
  }
}
