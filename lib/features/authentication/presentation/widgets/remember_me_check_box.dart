import 'package:flutter/material.dart';
import 'package:mova/core/global/global_varibles.dart';
import 'package:mova/core/resources/extensions.dart';

class RememberMeCheckBox extends StatefulWidget {
  final TextEditingController emailController;
  const RememberMeCheckBox({super.key, required this.emailController});
  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool value = false;
  bool _isValid = false;
  final globalVariables = GlobalVariables();
  @override
  void dispose() {
    super.dispose();
    widget.emailController.removeListener(() {});
    widget.emailController.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.emailController.addListener(() {
      widget.emailController.text.isEmailValid()
          ? setState(() {
              _isValid = true;
            })
          : setState(() {
              _isValid = false;
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.1,
      child: Checkbox(
        value: _isValid ? value : null,
        tristate: true,
        onChanged: (value) {
          setState(() {
            checkValueForNull(value);
          });
          if (value == true) {
            globalVariables.setUserDecision = true;
          }
          if (value == false) {
            globalVariables.setUserDecision = false;
          }
        },
      ),
    );
  }

  // this method is used to stop the checkBox from returning null value if the E-mail is valid.
  void checkValueForNull(bool? value) {
    if (value == null) {
      this.value = false;
    } else if (value == false || value == true) {
      this.value = value;
    }
  }
}
