import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/global/type_def.dart';
import 'package:mova/core/resources/values_manager.dart';
import '../../../../../../core/utils/general_button.dart';
import '../../../bloc/regular_sign/authentication_bloc.dart';
import './email_form.dart';
import 'password_form.dart';
import 'remember_me_row.dart';

class SignForm extends StatelessWidget {
  final AuthenticationEventFunction signEvent;
  final String buttonText;
  const SignForm({
    Key? key,
    required this.signEvent,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void saveForm() {
      if (formKey.currentState!.validate()) {
        BlocProvider.of<AuthenticationBloc>(context).add(signEvent(
            emailController.text.trim(), passwordController.text.trim()));
      }
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailForm(emailController: emailController),
          SizedBox(height: DoubleManager.d_2.h),
          PasswordForm(passwordController: passwordController),
          RememberMeRow(emailController: emailController),
          GeneralButton(buttonText: buttonText, function: saveForm),
        ],
      ),
    );
  }
}
