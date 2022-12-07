import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';
import '../resources/colors_manager.dart';
import '../resources/routes.dart';
import 'request_state.dart';
import 'snack_bar_util.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CachingUserDataBloc, CachingUserDataState>(
      listenWhen: (previous, current) =>
          previous.deleteCacheUserDataState != current.deleteCacheUserDataState,
      listener: (context, state) {
        if (state.deleteCacheUserDataState == RequestState.error) {
          SnackBarUtil().getSnackBar(
              context: context,
              message: state.deleteCacheUserDataMessage,
              color: ColorsManager.mainRedColor);
        }

        if (state.deleteCacheUserDataState == RequestState.success) {
          Navigator.of(context).pushNamed(Routes.signUpScreenKey);
        }
      },
      child: Center(
        child: IconButton(
          onPressed: () => BlocProvider.of<CachingUserDataBloc>(context)
              .add(DeleteCachedUserDataEvent()),
          icon: const Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}
