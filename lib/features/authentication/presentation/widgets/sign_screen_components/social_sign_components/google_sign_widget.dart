import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/features/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/routes.dart';
import '../../../../../../core/utils/loading_indicator_util.dart';
import '../../../../../../core/utils/request_state.dart';
import '../../../../../../core/utils/snack_bar_util.dart';
import '../../../bloc/social_sign/social_sign_bloc.dart';


class GoogleSignWidget extends StatelessWidget {
  final Widget googleSignView;
  const GoogleSignWidget({super.key, required this.googleSignView});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialSignBloc, SocialSignState>(
      listenWhen: (previous, current) =>
          previous.googleSignState != current.googleSignState,
      listener: (context, state) {
        if (state.googleSignState == RequestState.error) {
          return SnackBarUtil().getSnackBar(
              context: context,
              message: state.googleSignMessage,
              color: ColorsManager.mainRedColor);
        }
        if (state.googleSignState == RequestState.success) {
          BlocProvider.of<CachingUserDataBloc>(context).add(
            CacheUserDataEvent(userEmail: state.googleUserData.email),
          );
          Navigator.of(context)
              .pushReplacementNamed(Routes.onBoardingScreenKey);
        }
      },
      buildWhen: (previous, current) =>
          previous.googleSignState != current.googleSignState,
      builder: (context, state) {
        if (state.googleSignState == RequestState.loading) {
          return const LoadingIndicatorUtil();
        }
          return googleSignView;
      },
    );

  }
}
