import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/global/type_def.dart';
import 'package:mova/core/resources/values_manager.dart';
import 'package:mova/features/authentication/presentation/widgets/password_form.dart';
import 'package:mova/features/authentication/presentation/widgets/remember_me_check_box.dart';
import '../bloc/authentication_bloc.dart';
import 'email_form.dart';

class SignForm extends StatelessWidget {
  final AuthenticationEventFunction signEvent;
  const SignForm({
    Key? key,
    required this.signEvent,
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
          const SizedBox(height: DoubleManager.d_12),
          PasswordForm(passwordController: passwordController),
          RememberMeCheckBox(emailController: emailController),
          ElevatedButton(
            onPressed: () => saveForm(),
            child: const Text('save'),
          ),
        ],
      ),
    );
  }
}
