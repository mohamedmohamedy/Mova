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

  // Sign with Facebook state
  final RequestState facebookSignState;
  final String facebookSignMessage;
  final UserEntity facebookUserData;

  // Sign with Google state
  final RequestState googleSignState;
  final String googleSignMessage;
  final UserEntity googleUserData;

  // Verify User
  final bool userState;
  final RequestState verifyUserState;
  final String verifyUserMessage;

  // Cache user data
  final RequestState cacheUserDataState;
  final String cacheUserDataMessage;

  // get cached user data
  final RequestState getCacheUserDataState;
  final String getCacheUserDataMessage;

  const AuthenticationState({
    this.signInState = RequestState.stable,
    this.signInMessage = '',
    this.signUpState = RequestState.stable,
    this.signUpMessage = '',
    this.signOutState = RequestState.stable,
    this.signOutMessage = '',
    this.userState = false,
    this.facebookSignState = RequestState.stable,
    this.facebookSignMessage = '',
    this.facebookUserData = const UserEntity(email: '', password: ''),
    this.googleSignState = RequestState.stable,
    this.googleSignMessage = '',
    this.googleUserData = const UserEntity(email: '', password: ''),
    this.verifyUserState = RequestState.loading,
    this.verifyUserMessage = '',
    this.cacheUserDataState = RequestState.loading,
    this.cacheUserDataMessage = '',
    this.getCacheUserDataState = RequestState.loading,
    this.getCacheUserDataMessage = '',
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

    // Sign with Facebook
    RequestState? facebookSignState,
    String? facebookSignMessage,
    UserEntity? facebookUserData,

    // Sign with Google
    RequestState? googleSignState,
    String? googleSignMessage,
    UserEntity? googleUserData,

    // Verify User
    bool? userState,
    RequestState? verifyUserState,
    String? verifyUserMessage,

    // Cache user state
    RequestState? cacheUserDataState,
    String? cacheUserDataMessage,

    // get cached user state
    RequestState? getCacheUserDataState,
    String? getCacheUserDataMessage,
  }) {
    return AuthenticationState(
      signInMessage: signInMessage ?? this.signInMessage,
      signInState: signInState ?? this.signInState,
      signOutMessage: signOutMessage ?? this.signOutMessage,
      signOutState: signOutState ?? this.signOutState,
      signUpMessage: signUpMessage ?? this.signUpMessage,
      signUpState: signUpState ?? this.signUpState,
      facebookSignState: facebookSignState ?? this.facebookSignState,
      facebookSignMessage: facebookSignMessage ?? this.facebookSignMessage,
      facebookUserData: facebookUserData ?? this.facebookUserData,
      googleSignState: googleSignState ?? this.googleSignState,
      googleSignMessage: googleSignMessage ?? this.googleSignMessage,
      googleUserData: googleUserData ?? this.googleUserData,
      userState: userState ?? this.userState,
      verifyUserMessage: verifyUserMessage ?? this.verifyUserMessage,
      verifyUserState: verifyUserState ?? this.verifyUserState,
      cacheUserDataState: cacheUserDataState ?? this.cacheUserDataState,
      cacheUserDataMessage: cacheUserDataMessage ?? this.cacheUserDataMessage,
      getCacheUserDataState:
          getCacheUserDataState ?? this.getCacheUserDataState,
      getCacheUserDataMessage:
          getCacheUserDataMessage ?? this.getCacheUserDataMessage,
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
        facebookSignState,
        facebookSignMessage,
        facebookUserData,
        googleSignState,
        googleSignMessage,
        googleUserData,
        verifyUserMessage,
        verifyUserState,
        cacheUserDataState,
        cacheUserDataMessage,
        getCacheUserDataState,
        getCacheUserDataMessage,
      ];
}
