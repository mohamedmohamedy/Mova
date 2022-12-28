import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/routes.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/general_button.dart';
import '../../../../core/utils/request_state.dart';
import '../../../authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CachingUserDataBloc, CachingUserDataState>(
      listener: (context, state) {
        if (state.getCacheUserDataState == RequestState.error) {
          Navigator.of(context)
              .pushReplacementNamed(Routes.socialSignScreenKey);
        }
        if (state.getCacheUserDataState == RequestState.success) {
          Navigator.of(context)
              .pushReplacementNamed(Routes.onBoardingScreenKey);
        }
      },
      child: GeneralButton(
        buttonText: StringsManager.getStarted,
        function: () => BlocProvider.of<CachingUserDataBloc>(context)
            .add(GetCachedUserDataEvent()),
      ),
    );
  }
}
