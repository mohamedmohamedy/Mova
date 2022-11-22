import 'package:flutter/material.dart';
import 'package:mova/core/global/global_varibles.dart';
import 'package:mova/core/resources/extensions.dart';
import 'package:mova/core/resources/fonts_manager.dart';
import 'package:mova/core/resources/styles_manager.dart';

import '../../../../core/resources/strings_manager.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final globalVariables = GlobalVariables();
    return TextFormField(
      controller: emailController,
      style: getRegularStyle(
          fontName: FontsName.generalFont, fontSize: FontsSize.s16),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, size: Theme.of(context).iconTheme.size),
        hintText: StringsManager.email,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || !value.isEmailValid()) {
          return StringsManager.emailValidateMessage;
        }
        return null;
      },
      onSaved: (_) {
        globalVariables.setGlobalUserEmail = emailController.text;
        emailController.clear();
        emailController.dispose();
      },
    );
  }
}
