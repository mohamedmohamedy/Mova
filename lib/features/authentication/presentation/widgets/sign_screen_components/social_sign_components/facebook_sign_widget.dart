import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/routes.dart';
import '../../../../../../core/utils/loading_indicator_util.dart';
import '../../../../../../core/utils/request_state.dart';
import '../../../../../../core/utils/snack_bar_util.dart';
import '../../../bloc/caching_user_data/caching_user_data_bloc.dart';
import '../../../bloc/social_sign/social_sign_bloc.dart';

class FacebookSignWidget extends StatelessWidget {
  final Widget facebookSignView;
  const FacebookSignWidget({super.key, required this.facebookSignView});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialSignBloc, SocialSignState>(
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
          BlocProvider.of<CachingUserDataBloc>(context).add(
            CacheUserDataEvent(userEmail: state.facebookUserData.email),
          );
          Navigator.of(context)
              .pushReplacementNamed(Routes.onBoardingScreenKey);
        }
      },
      buildWhen: (previous, current) =>
          previous.facebookSignState != current.facebookSignState,
      builder: (context, state) {
        if (state.facebookSignState == RequestState.loading) {
          return const LoadingIndicatorUtil();
        }
        return facebookSignView;
      },
    );
  }
}
