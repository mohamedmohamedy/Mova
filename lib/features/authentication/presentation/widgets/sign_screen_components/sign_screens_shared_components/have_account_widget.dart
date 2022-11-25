import 'package:flutter/material.dart';
import 'package:mova/core/resources/fonts_manager.dart';
import 'package:mova/core/resources/strings_manager.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringsManager.alreadyHaveAnAccount,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: FontsSize.s12),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(StringsManager.signIn),
        )
      ],
    );
  }
}
