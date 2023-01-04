part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  // Sign in state
  final RequestState signInState;
  final String signInMessage;

  // Sign up state
  final RequestState signUpState;
  final String signUpMessage;

  // Verify User
  final bool userState;
  final RequestState verifyUserState;
  final String verifyUserMessage;


  // Reset password
  final RequestState resetPasswordState;
  final String resetPasswordMessage;

  const AuthenticationState({
    this.signInState = RequestState.stable,
    this.signInMessage = '',
    this.signUpState = RequestState.stable,
    this.signUpMessage = '',
    this.userState = false,
    this.verifyUserState = RequestState.loading,
    this.verifyUserMessage = '',
    this.resetPasswordState = RequestState.stable,
    this.resetPasswordMessage = '',
  });

  AuthenticationState copyWith({
    // Sign in state
    RequestState? signInState,
    String? signInMessage,

    // Sign up state
    RequestState? signUpState,
    String? signUpMessage,

    // Verify User
    bool? userState,
    RequestState? verifyUserState,
    String? verifyUserMessage,

    
  // Reset password
   RequestState? resetPasswordState,
   String? resetPasswordMessage,


  }) {
    return AuthenticationState(
      signInMessage: signInMessage ?? this.signInMessage,
      signInState: signInState ?? this.signInState,
      signUpMessage: signUpMessage ?? this.signUpMessage,
      signUpState: signUpState ?? this.signUpState,
      userState: userState ?? this.userState,
      verifyUserMessage: verifyUserMessage ?? this.verifyUserMessage,
      verifyUserState: verifyUserState ?? this.verifyUserState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      resetPasswordMessage: resetPasswordMessage ?? this.resetPasswordMessage, 
    );
  }

  @override
  List<Object> get props => [
        signInMessage,
        signInState,
        signUpMessage,
        signUpState,
        userState,
        verifyUserMessage,
        verifyUserState,
        resetPasswordState,
        resetPasswordMessage,
      ];
}