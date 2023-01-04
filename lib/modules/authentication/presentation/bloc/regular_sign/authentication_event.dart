part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthenticationEvent {
  final UserEntity user;
  const SignInEvent({required this.user});
}

class SignUpEvent extends AuthenticationEvent {
  final UserEntity user;
  const SignUpEvent({required this.user});
}

class ResetPasswordEvent extends AuthenticationEvent {
  final String email;
  const ResetPasswordEvent({required this.email});
}

class VerifyUserEvent extends AuthenticationEvent {}
