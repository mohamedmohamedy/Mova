import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mova/core/resources/values_manager.dart';
import 'package:mova/features/authentication/presentation/widgets/facebook_sign_widget.dart';
import 'package:mova/features/authentication/presentation/widgets/social_sign_components.dart';
import 'package:sizer/sizer.dart';

import '../bloc/authentication_bloc.dart';

class SocialSignWidget extends StatelessWidget {
  const SocialSignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: DoubleManager.d_10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FacebookSignWidget(
              facebookSignView: SocialSignComponent(
                authIcon: FontAwesomeIcons.facebook,
                signEvent: SignWithFacebookEvent(),
              ),
            ),
          ],
        ));
  }
}
