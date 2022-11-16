import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/global/global_varibles.dart';
import 'package:mova/core/resources/routes.dart';
import 'package:mova/core/utils/loading_indicator_util.dart';
import '../../../../core/utils/request_state.dart';
import '../../../../core/utils/snack_bar_util.dart';
import '../bloc/authentication_bloc.dart';
import '../widgets/verifying_component.dart';

class VerifyTestScreen extends StatelessWidget {
  const VerifyTestScreen({super.key});
  @override
  Widget build(BuildContext context) {
    log('build');
    Timer? timer;
    bool verified = false;
    BlocProvider.of<AuthenticationBloc>(context).add(VerifyUserEvent());
    final globalVariables = GlobalVariables();
    // to check if he user is verified
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (verified) {
        timer.cancel;
        return;
      }
      log('new timer');
      BlocProvider.of<AuthenticationBloc>(context).add(VerifyUserEvent());
    });
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        // listenWhen: (previous, current) =>
        //     previous.verifyUserState != current.verifyUserState,
        buildWhen: (previous, current) =>
            previous.verifyUserState != current.verifyUserState,
        listener: (context, state) {
          log(state.userState.toString());
          switch (state.userState) {
            case false:
              break;
            case true:
              verified = true;
              timer?.cancel();
              if (globalVariables.getUserDecision) {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  CacheUserDataEvent(userEmail: globalVariables.getGlobalUserEmail),
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
        builder: (context, state) {
          switch (state.verifyUserState) {
            case RequestState.stable:
              return const Text('stable');
            case RequestState.loading:
              return const LoadingIndicatorUtil();
            case RequestState.success:
              if (state.userState == false) {
                log('component build');
                return const VerifyingComponent();
              }
              return const SizedBox(
                child: Text('success'),
              );
            case RequestState.error:
              return const SizedBox(
                child: Text('error'),
              );
          }
        },
      ),
    );
  }
}
