import 'package:flutter/material.dart';
import 'package:mova/core/resources/routes.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../dependency_container.dart' as di;

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            di
                .sl<SharedPreferences>()
                .remove(StringsManager.userCachedEmailKey);
            Navigator.of(context).pushNamed(Routes.signUpScreenKey);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
