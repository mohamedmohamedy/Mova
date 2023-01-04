import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/request_state.dart';
import '../../../domain/usecases/otp_verification_use_case.dart';
import '../../../domain/usecases/sign_with_phone_number.dart';

part 'phone_number_sign_event.dart';
part 'phone_number_sign_state.dart';

class PhoneNumberSignBloc
    extends Bloc<PhoneNumberSignEvent, PhoneNumberSignState> {
  final SignWithPhoneNumberUseCase signWithPhoneNumber;
  final OtpVerificationUseCase otpVerification;

  PhoneNumberSignBloc(
    this.signWithPhoneNumber,
    this.otpVerification,
  ) : super(const PhoneNumberSignState()) {
    on<SignWithPhoneNumberEvent>(_signWithPhoneNumber);
    on<OtpVerificationEvent>(_otpVerification);
  }

  //__________________________Sign with phone number________________________________________
  FutureOr<void> _signWithPhoneNumber(SignWithPhoneNumberEvent event,
      Emitter<PhoneNumberSignState> emit) async {
    emit(state.copyWith(phoneNumberSignState: RequestState.loading));
    final result = await signWithPhoneNumber(event.phoneNumber);

    result.fold(
      (failure) => emit(state.copyWith(
        phoneNumberSignState: RequestState.error,
        phoneNumberSignMessage: failure.errorMessage,
      )),
      (authState) => emit(state.copyWith(
        phoneNumberSignState: RequestState.success,
        phoneAuthState: authState,
      )),
    );
  }

  //__________________________Otp verification________________________________________
  FutureOr<void> _otpVerification(
      OtpVerificationEvent event, Emitter<PhoneNumberSignState> emit) async {
    emit(state.copyWith(otpVerificationState: RequestState.loading));

    final result = await otpVerification(event.code);

    result.fold(
      (failure) => emit(state.copyWith(
        otpVerificationState: RequestState.error,
        otpVerificationMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        otpVerificationState: RequestState.success,
      )),
    );
  }
}
