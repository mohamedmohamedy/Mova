part of 'phone_number_sign_bloc.dart';

class PhoneNumberSignState extends Equatable {
  // Sign with Phone number state
  final RequestState phoneNumberSignState;
  final String phoneNumberSignMessage;
  final PhoneAuthState phoneAuthState;

  // Otp verification state
  final RequestState otpVerificationState;
  final String otpVerificationMessage;

  const PhoneNumberSignState({
    this.phoneNumberSignState = RequestState.stable,
    this.phoneNumberSignMessage = '',
    this.phoneAuthState = PhoneAuthState.manual,
    this.otpVerificationState = RequestState.stable,
    this.otpVerificationMessage = '',
  });

  PhoneNumberSignState copyWith({
    // Sign with phone number
    RequestState? phoneNumberSignState,
    String? phoneNumberSignMessage,
    PhoneAuthState? phoneAuthState,

    // otp verification
    RequestState? otpVerificationState,
    String? otpVerificationMessage,
  }) {
    return PhoneNumberSignState(
      phoneNumberSignState: phoneNumberSignState ?? this.phoneNumberSignState,
      phoneNumberSignMessage:
          phoneNumberSignMessage ?? this.phoneNumberSignMessage,
      phoneAuthState: phoneAuthState ?? this.phoneAuthState,
      otpVerificationState: otpVerificationState ?? this.otpVerificationState,
      otpVerificationMessage:
          otpVerificationMessage ?? this.otpVerificationMessage,
    );
  }

  @override
  List<Object> get props => [
        phoneNumberSignState,
        phoneNumberSignMessage,
        phoneAuthState,
        otpVerificationState,
        otpVerificationMessage,
      ];
}
