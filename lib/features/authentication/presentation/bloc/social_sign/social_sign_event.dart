part of 'social_sign_bloc.dart';

abstract class SocialSignEvent extends Equatable {
  const SocialSignEvent();

  @override
  List<Object> get props => [];
}

class SignWithFacebookEvent extends SocialSignEvent {}

class SignWithGoogleEvent extends SocialSignEvent {}