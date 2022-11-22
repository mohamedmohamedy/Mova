import 'package:flutter/material.dart';
import 'package:mova/core/resources/fonts_manager.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/features/authentication/presentation/widgets/remember_me_check_box.dart';

class RememberMeRow extends StatelessWidget {
  final TextEditingController emailController;
  const RememberMeRow({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RememberMeCheckBox(emailController: emailController),
        Text(
          StringsManager.rememberMe,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: FontsSize.s12,
              ),
        ),
      ],
    );
  }
}
