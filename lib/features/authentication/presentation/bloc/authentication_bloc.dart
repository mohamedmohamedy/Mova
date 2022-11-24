import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/utils/request_state.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';
import 'package:mova/features/authentication/domain/usecases/cache_user_use_case.dart';
import 'package:mova/features/authentication/domain/usecases/get_cached_user_use_case.dart';
import 'package:mova/features/authentication/domain/usecases/sign_in_use_case.dart';
import 'package:mova/features/authentication/domain/usecases/sign_out_use_case.dart';
import 'package:mova/features/authentication/domain/usecases/sign_up_use_case.dart';
import 'package:mova/features/authentication/domain/usecases/sign_with_facebook_use_case.dart';
import 'package:mova/features/authentication/domain/usecases/sign_with_google.dart';
import 'package:mova/features/authentication/domain/usecases/verify_user_use_case.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignInUseCase signIn;
  final SignUpUseCase signUp;
  final SignOutUseCase signOut;
  final SignWithFacebookUseCase signWithFacebook;
  final SignWithGoogleUseCase signWithGoogle;
  final VerifyUserUseCase verifyUser;
  final CacheUserUseCase _cacheUser;
  final GetCachedUserUseCase _getCachedUser;

  AuthenticationBloc(
    this.signIn,
    this.signUp,
    this.signOut,
    this.verifyUser,
    this._cacheUser,
    this._getCachedUser,
    this.signWithFacebook,
    this.signWithGoogle,
  ) : super(const AuthenticationState()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
    on<SignOutEvent>(_signOut);
    on<VerifyUserEvent>(_verifyUser);
    on<CacheUserDataEvent>(_cacheUserMethod);
    on<GetCachedUserDataEvent>(_getCachedUserMethod);
    on<SignWithFacebookEvent>(_signWithFacebook);
    on<SignWithGoogleEvent>(_signWithGoogle);
  }
  //__________________________Sign in event_______________________________________
  FutureOr<void> _signIn(
      SignInEvent event, Emitter<AuthenticationState> emit) async {
    final result = await signIn(event.user);

    result.fold(
      (failure) => emit(state.copyWith(
          signInState: RequestState.error,
          signInMessage: failure.errorMessage)),
      (_) => emit(state.copyWith(
        signInState: RequestState.success,
      )),
    );
  }

  //__________________________Sign up event_______________________________________
  FutureOr<void> _signUp(
      SignUpEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(signUpState: RequestState.loading));

    final result = await signUp(event.user);

    result.fold(
      (failure) => emit(state.copyWith(
        signUpState: RequestState.error,
        signUpMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        signUpState: RequestState.success,
      )),
    );
  }

  //__________________________Sign out event_______________________________________
  FutureOr<void> _signOut(
      SignOutEvent event, Emitter<AuthenticationState> emit) async {
    final result = await signOut(const NoParameters());

    result.fold(
      (failure) => emit(
        state.copyWith(
          signOutState: RequestState.error,
          signOutMessage: failure.errorMessage,
        ),
      ),
      (_) => emit(state.copyWith(
        signOutState: RequestState.success,
      )),
    );
  }

  //__________________________Sign with Facebook event__________________________________
  FutureOr<void> _signWithFacebook(
      SignWithFacebookEvent event, Emitter<AuthenticationState> emit) async {
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
      SignWithGoogleEvent event, Emitter<AuthenticationState> emit) async {
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

  //__________________________Verify user event_______________________________________
  FutureOr<void> _verifyUser(
      VerifyUserEvent event, Emitter<AuthenticationState> emit) async {
    final result = await verifyUser(const NoParameters());

    result.fold(
      (failure) => emit(state.copyWith(
        verifyUserState: RequestState.error,
        verifyUserMessage: failure.errorMessage,
      )),
      (result) => emit(state.copyWith(
        verifyUserState: RequestState.success,
        userState: result,
      )),
    );
  }

  //__________________________Cache user data event______________________________________
  FutureOr<void> _cacheUserMethod(
      CacheUserDataEvent event, Emitter<AuthenticationState> emit) async {
    final result = await _cacheUser(event.userEmail);

    result.fold(
      (failure) => emit(state.copyWith(
        cacheUserDataState: RequestState.error,
        cacheUserDataMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        cacheUserDataState: RequestState.success,
      )),
    );
  }

  //__________________________Get cache user data event____________________________________
  FutureOr<void> _getCachedUserMethod(
      GetCachedUserDataEvent event, Emitter<AuthenticationState> emit) async {
    final result = await _getCachedUser(const NoParameters());

    result.fold(
      (failure) => emit(state.copyWith(
        getCacheUserDataState: RequestState.error,
        getCacheUserDataMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        getCacheUserDataState: RequestState.success,
      )),
    );
  }
}
