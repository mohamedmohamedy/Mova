import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/global/base_use_case.dart';
import '../../../../../core/utils/request_state.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/sign_with_facebook_use_case.dart';
import '../../../domain/usecases/sign_with_google.dart';

part 'social_sign_event.dart';
part 'social_sign_state.dart';

class SocialSignBloc extends Bloc<SocialSignEvent, SocialSignState> {
  final SignWithFacebookUseCase signWithFacebook;
  final SignWithGoogleUseCase signWithGoogle;

  SocialSignBloc(
    this.signWithFacebook,
    this.signWithGoogle,
  ) : super(const SocialSignState()) {
    on<SignWithFacebookEvent>(_signWithFacebook);
    on<SignWithGoogleEvent>(_signWithGoogle);
  }

  //__________________________Sign with Facebook event__________________________________
  FutureOr<void> _signWithFacebook(
      SignWithFacebookEvent event, Emitter<SocialSignState> emit) async {
    emit(state.copyWith(facebookSignState: RequestState.loading));
    final result = await signWithFacebook(const NoParameters());

    result.fold(
      (failure) => emit(state.copyWith(
        facebookSignState: RequestState.error,
        facebookSignMessage: failure.errorMessage,
      )),
      (userData) => emit(state.copyWith(
        facebookSignState: RequestState.success,
        facebookUserData: userData,
      )),
    );
  }

  //__________________________Sign with Google________________________________________
  FutureOr<void> _signWithGoogle(
      SignWithGoogleEvent event, Emitter<SocialSignState> emit) async {
    emit(state.copyWith(googleSignState: RequestState.loading));

    final result = await signWithGoogle(const NoParameters());

    result.fold(
      (failure) => emit(state.copyWith(
        googleSignState: RequestState.error,
        googleSignMessage: failure.errorMessage,
      )),
      (userData) => emit(state.copyWith(
        googleSignState: RequestState.success,
        googleUserData: userData,
      )),
    );
  }
}
