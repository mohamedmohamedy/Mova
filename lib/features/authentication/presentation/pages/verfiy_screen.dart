import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/resources/values_manager.dart';
import '../../../../core/global/global_varibles.dart';
import '../../../../core/resources/routes.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../bloc/caching_user_data/caching_user_data_bloc.dart';
import '../../../../core/utils/request_state.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../bloc/regular_sign/authentication_bloc.dart';
import '../widgets/verifying_component.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final globalVariables = GlobalVariables();
    Timer? timer;
    bool verified = false;

    BlocProvider.of<AuthenticationBloc>(context).add(VerifyUserEvent());

    // to check if the user is verified
    timer = Timer.periodic(const Duration(seconds: IntManager.i_2), (timer) {
      if (verified) {
        timer.cancel;
        return;
      }
      BlocProvider.of<AuthenticationBloc>(context).add(VerifyUserEvent());
    });

    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.userState) {
            case false:
              break;

            case true:
              verified = true;
              timer?.cancel();
              if (globalVariables.getUserDecision) {
                BlocProvider.of<CachingUserDataBloc>(context).add(
                  CacheUserDataEvent(
                      userEmail: globalVariables.getGlobalUserEmail),
                );
              }
              Navigator.of(context)
                  .pushReplacementNamed(Routes.onBoardingScreenKey);
              break;
          }

          if (state.verifyUserState == RequestState.error) {
            return SnackBarUtil().getSnackBar(
                context: context,
                message: state.signUpMessage,
                color: Colors.red);
          }
        },
        buildWhen: (previous, current) =>
            previous.verifyUserState != current.verifyUserState,
        builder: (context, state) {
          if (state.verifyUserState == RequestState.loading) {
            return const LoadingIndicatorUtil();
          }
          return const VerifyingComponent();
        },
      ),
    );
  }
}
