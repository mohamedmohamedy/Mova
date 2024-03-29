import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/request_state.dart';
import '../../domain/entities/user.dart';
import '../bloc/regular_sign/authentication_bloc.dart';
import '../widgets/sign_screen_components/form_components/sign_form.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/authentication_divider.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/have_account_widget.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/main_logo.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/sign_type_text.dart';
import '../widgets/sign_screen_components/social_sign_components/social_sign_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (previous, current) =>
              previous.signUpState != current.signUpState,
          listener: (context, state) {
            if (state.signUpState == RequestState.success) {
              Navigator.of(context).pushNamed(Routes.verificationScreenKey);
            }

            if (state.signUpState == RequestState.error) {
              SnackBarUtil().getSnackBar(
                  context: context,
                  message: state.signUpMessage,
                  color: Colors.red);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: DoubleManager.d_16),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const MainLogo(),
                      const SignTypeText(signSentence: StringsManager.create),
                      SignForm(
                          signEvent: signEvent,
                          buttonText: StringsManager.signUp),
                      const AuthenticationDivider(
                          text: StringsManager.authenticationDividerText),
                      const SocialSignWidget(),
                      const HaveAccountWidget(
                        buttonText: StringsManager.signIn,
                        question: StringsManager.alreadyHaveAnAccount,
                        routeName: Routes.signInScreenKey,
                      ),
                    ],
                  ),
                ),
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
