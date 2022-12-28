import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/images_path.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/top_screen_back_arrow.dart';
import '../bloc/social_sign/social_sign_bloc.dart';
import '../widgets/sign_screen_components/sign_screens_shared_components/authentication_divider.dart';
import '../widgets/sign_screen_components/social_sign_components/facebook_sign_widget.dart';
import '../widgets/sign_screen_components/social_sign_components/google_sign_widget.dart';
import '../widgets/sign_screen_components/social_sign_components/phone_number_widget.dart';
import '../widgets/sign_screen_components/social_sign_screen_components/phone_view.dart';
import '../widgets/sign_screen_components/social_sign_screen_components/social_buttons.dart';
import 'package:sizer/sizer.dart';

import '../widgets/sign_screen_components/sign_screens_shared_components/have_account_widget.dart';

class SocialSignScreen extends StatelessWidget {
  const SocialSignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: DoubleManager.d_1.h,
                    horizontal: DoubleManager.d_5.w),
                child: Column(
                  children: [
                    Image.asset(
                      ImagesPath.socialSignPath,
                      fit: BoxFit.cover,
                      height: DoubleManager.d_30.h,
                      width: DoubleManager.d_60.w,
                    ),
                    Text(
                      StringsManager.letsDiveInText,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: FontsSize.s30),
                    ),
                    FacebookSignWidget(
                        facebookSignView: SocialSignScreenButtons(
                      signEvent: SignWithFacebookEvent(),
                      icon: FontAwesomeIcons.facebook,
                      signType: StringsManager.facebook,
                    )),
                    SizedBox(height: DoubleManager.d_2.h),
                    GoogleSignWidget(
                        googleSignView: SocialSignScreenButtons(
                      signEvent: SignWithGoogleEvent(),
                      icon: FontAwesomeIcons.google,
                      signType: StringsManager.google,
                    )),
                    SizedBox(height: DoubleManager.d_2.h),
                    const SignWithPhoneNumberWidget(
                        phoneNumberSignView: SignScreenPhoneView()),
                    const AuthenticationDivider(text: StringsManager.or),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: DoubleManager.d_1.h),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed(Routes.signInScreenKey),
                        child: Text(
                          StringsManager.signInWithPassword,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontSize: FontsSize.s14),
                        ),
                      ),
                    ),
                    const HaveAccountWidget(
                      question: StringsManager.dontHaveAnAccount,
                      buttonText: StringsManager.signUp,
                      routeName: Routes.signUpScreenKey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
