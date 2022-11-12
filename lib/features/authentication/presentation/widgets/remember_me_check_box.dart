import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/resources/extensions.dart';
import 'package:mova/core/utils/request_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../bloc/authentication_bloc.dart';
import '../../../../dependency_container.dart' as di;

class RememberMeCheckBox extends StatefulWidget {
  final TextEditingController emailController;
  const RememberMeCheckBox({super.key, required this.emailController});

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool value = false;
  bool _isValid = false;

  @override
  void dispose() {
    super.dispose();
    widget.emailController.removeListener(() {
      log('cleared');
    });
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
    log('build');
    return
        //  _isValid
        //     ?
        Transform.scale(
      scale: 1.1,
      child: Checkbox(
        value: _isValid ? value : null,
        tristate: true,
        onChanged: (value) {
          setState(() {
            this.value = value!;
          });
          if (value == true) {
            BlocProvider.of<AuthenticationBloc>(context).add(
                CacheUserDataEvent(userEmail: widget.emailController.text));
          }
          //______________________/ to be changed with clean arch \__________________________
          if (value == false) {
            if (di
                .sl<SharedPreferences>()
                .containsKey(StringsManager.userCachedEmailKey)) {
              di
                  .sl<SharedPreferences>()
                  .remove(StringsManager.userCachedEmailKey);
            }
          }

          //___________________________________________________________________________________
        },
      ),
    );
    // : Icon(
    //     Icons.disabled_by_default,
    //     size: 40,
    //     color: Colors.red,
    //   );
  }
}
