part of 'phone_number_sign_bloc.dart';

abstract class PhoneNumberSignEvent extends Equatable {
  const PhoneNumberSignEvent();

  @override
  List<Object> get props => [];
}

class SignWithPhoneNumberEvent extends PhoneNumberSignEvent {
  final String phoneNumber;
  const SignWithPhoneNumberEvent(this.phoneNumber);
}

class OtpVerificationEvent extends PhoneNumberSignEvent {
  final String code;
  const OtpVerificationEvent({required this.code});
}