import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/global/base_use_case.dart';
import '../../../../../core/utils/request_state.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/reset_password_use_case.dart';
import '../../../domain/usecases/sign_in_use_case.dart';
import '../../../domain/usecases/sign_up_use_case.dart';
import '../../../domain/usecases/verify_user_use_case.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignInUseCase signIn;
  final SignUpUseCase signUp;
  final VerifyUserUseCase verifyUser;
  final ResetPasswordUseCase resetPassword;

  AuthenticationBloc(
    this.signIn,
    this.signUp,
    this.verifyUser,
    this.resetPassword,
  ) : super(const AuthenticationState()) {
    on<SignInEvent>(_signIn);
    on<SignUpEvent>(_signUp);
    on<VerifyUserEvent>(_verifyUser);
    on<ResetPasswordEvent>(_resetPassword);
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

  //__________________________Reset password event_______________________________________
  FutureOr<void> _resetPassword(
      ResetPasswordEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(resetPasswordState: RequestState.loading));
    final result = await resetPassword(event.email);

    result.fold(
      (failure) => emit(state.copyWith(
        resetPasswordState: RequestState.error,
        resetPasswordMessage: failure.errorMessage,
      )),
      (_) => emit(state.copyWith(
        resetPasswordState: RequestState.success,
      )),
    );
  }
}
