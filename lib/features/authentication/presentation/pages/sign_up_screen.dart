import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/core/utils/snack_bar_util.dart';
import 'package:mova/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:mova/features/authentication/presentation/widgets/sign_form.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/request_state.dart';
import '../../domain/entities/user.dart';

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
          child: Column(
            children: [
              SignForm(signEvent: signEvent, buttonText: StringsManager.signUp),
            ],
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
