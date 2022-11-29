import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/core/global/global_varibles.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/core/utils/loading_indicator_util.dart';
import 'package:mova/core/utils/phone_number_Picker.dart';
import 'package:mova/features/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/routes.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/utils/request_state.dart';
import '../../../../../../core/utils/snack_bar_util.dart';
import '../../../bloc/phone_number_sign/phone_number_sign_bloc.dart';

class SignWithPhoneNumberWidget extends StatelessWidget {
  final Widget phoneNumberSignView;

  const SignWithPhoneNumberWidget({
    Key? key,
    required this.phoneNumberSignView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalVariables = GlobalVariables();
    return BlocConsumer<PhoneNumberSignBloc, PhoneNumberSignState>(
      listenWhen: (previous, current) =>
          previous.phoneNumberSignState != current.phoneNumberSignState ||
          previous.otpVerificationState != current.otpVerificationState,
      listener: (context, state) {
        // check if the user auto validated the OTP code.
        if (state.phoneAuthState == PhoneAuthState.automatic) {
          BlocProvider.of<CachingUserDataBloc>(context).add(CacheUserDataEvent(
              userEmail: globalVariables.getGlobalUserEmail));
          Navigator.of(context)
              .pushReplacementNamed(Routes.onBoardingScreenKey);
        }

        // If the user didn't validated automatically then an alert dialog will pop to enter the code.
        if (state.phoneAuthState == PhoneAuthState.manual) {
          whenNotAutomaticSign(context);
        }
        if (state.otpVerificationState == RequestState.success) {
          BlocProvider.of<CachingUserDataBloc>(context).add(CacheUserDataEvent(
              userEmail: globalVariables.getGlobalUserEmail));
          Navigator.of(context)
              .pushReplacementNamed(Routes.onBoardingScreenKey);
        }

        if (state.otpVerificationState == RequestState.error) {
          return SnackBarUtil().getSnackBar(
              context: context,
              message: state.otpVerificationMessage,
              color: ColorsManager.mainRedColor);
        }

        if (state.phoneAuthState == RequestState.error) {
          return SnackBarUtil().getSnackBar(
              context: context,
              message: state.phoneNumberSignMessage,
              color: ColorsManager.mainRedColor);
        }
      },
      buildWhen: (previous, current) =>
          previous.phoneNumberSignState != current.phoneNumberSignState ||
          previous.otpVerificationState != current.otpVerificationState,
      builder: (context, state) {
        if (state.phoneNumberSignState == RequestState.loading) {
          return const LoadingIndicatorUtil();
        }
        return InkWell(
          borderRadius: BorderRadius.circular(DoubleManager.d_12.sp),
          onTap: () => openDialogForRegistrationByPhone(context),
          child: phoneNumberSignView,
        );
      },
    );
  }

  void openDialogForRegistrationByPhone(BuildContext context) {
    final globalVariables = GlobalVariables();
    String? userPhone;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(StringsManager.phoneNumberMessage),
        content: PhoneNumberPicker(phoneNumber: (phone) => userPhone = phone),
        actions: [
          TextButton(
            onPressed: () {
              globalVariables.setGlobalUserEmail = userPhone!;
              BlocProvider.of<PhoneNumberSignBloc>(context)
                  .add(SignWithPhoneNumberEvent(userPhone!.trim()));
            },
            child: const Text(StringsManager.enter),
          )
        ],
      ),
    );
  }

  // When the user didn't auto validated the code.
  Future<void> whenNotAutomaticSign(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(StringsManager.enterCode),
        content: TextField(
          keyboardType: TextInputType.number,
          onSubmitted: (value) async {
            BlocProvider.of<PhoneNumberSignBloc>(context)
                .add(OtpVerificationEvent(code: value.trim()));
          },
        ),
      ),
    );
  }
}
