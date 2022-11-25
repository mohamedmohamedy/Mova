part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  // Sign in state
  final RequestState signInState;
  final String signInMessage;

  // Sign up state
  final RequestState signUpState;
  final String signUpMessage;

  // Sign out state
  final RequestState signOutState;
  final String signOutMessage;

  // Verify User
  final bool userState;
  final RequestState verifyUserState;
  final String verifyUserMessage;

  const AuthenticationState({
    this.signInState = RequestState.stable,
    this.signInMessage = '',
    this.signUpState = RequestState.stable,
    this.signUpMessage = '',
    this.signOutState = RequestState.stable,
    this.signOutMessage = '',
    this.userState = false,
    this.verifyUserState = RequestState.loading,
    this.verifyUserMessage = '',
  });

  AuthenticationState copyWith({
    // Sign in state
    RequestState? signInState,
    String? signInMessage,

    // Sign up state
    RequestState? signUpState,
    String? signUpMessage,

    // Sign out state
    RequestState? signOutState,
    String? signOutMessage,

    // Verify User
    bool? userState,
    RequestState? verifyUserState,
    String? verifyUserMessage,
  }) {
    return AuthenticationState(
      signInMessage: signInMessage ?? this.signInMessage,
      signInState: signInState ?? this.signInState,
      signOutMessage: signOutMessage ?? this.signOutMessage,
      signOutState: signOutState ?? this.signOutState,
      signUpMessage: signUpMessage ?? this.signUpMessage,
      signUpState: signUpState ?? this.signUpState,
      userState: userState ?? this.userState,
      verifyUserMessage: verifyUserMessage ?? this.verifyUserMessage,
      verifyUserState: verifyUserState ?? this.verifyUserState,
    );
  }

  @override
  List<Object> get props => [
        signInMessage,
        signInState,
        signOutMessage,
        signOutState,
        signUpMessage,
        signUpState,
        userState,
        verifyUserMessage,
        verifyUserState,
      ];
}