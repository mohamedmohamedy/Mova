import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/global/global_varibles.dart';
import 'package:mova/core/resources/colors_manager.dart';
import 'package:mova/core/resources/routes.dart';
import 'package:mova/core/resources/values_manager.dart';
import 'package:mova/core/utils/loading_indicator_util.dart';
import 'package:mova/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:mova/features/authentication/presentation/widgets/social_sign_components.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/request_state.dart';
import '../../../../core/utils/snack_bar_util.dart';

class SocialSignWidget extends StatelessWidget {
  const SocialSignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) =>
          previous.facebookSignState != current.facebookSignState,
      listener: (context, state) {
        if (state.facebookSignState == RequestState.error) {
          return SnackBarUtil().getSnackBar(
              context: context,
              message: state.facebookSignMessage,
              color: ColorsManager.mainRedColor);
        }
        if (state.facebookSignState == RequestState.success) {
          GlobalVariables().setGlobalUserEmail = state.facebookUserData.email;
          BlocProvider.of<AuthenticationBloc>(context).add(
            CacheUserDataEvent(userEmail: state.facebookUserData.email),
          );
          Navigator.of(context)
              .pushReplacementNamed(Routes.onBoardingScreenKey);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: DoubleManager.d_10.w),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          buildWhen: (previous, current) =>
              previous.facebookSignState != current.facebookSignState,
          builder: (context, state) {
            if (state.facebookSignState == RequestState.stable) {
              return const SocialWidgets();
            }
            if (state.facebookSignState == RequestState.loading) {
              return const LoadingIndicatorUtil();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class SocialWidgets extends StatelessWidget {
  const SocialWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialSignComponent(
            authIcon: FontAwesomeIcons.facebook,
            signEvent: SignWithFacebookEvent()),
        // SocialSignComponent(authIcon: FontAwesomeIcons.google),
        // SocialSignComponent(authIcon: FontAwesomeIcons.apple),
      ],
    );
  }
}
