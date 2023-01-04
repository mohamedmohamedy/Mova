part of 'social_sign_bloc.dart';

class SocialSignState extends Equatable {
  // Sign with Facebook state
  final RequestState facebookSignState;
  final String facebookSignMessage;
  final UserEntity facebookUserData;

  // Sign with Google state
  final RequestState googleSignState;
  final String googleSignMessage;
  final UserEntity googleUserData;

  const SocialSignState({
    this.facebookSignState = RequestState.stable,
    this.facebookSignMessage = '',
    this.facebookUserData = const UserEntity(email: '', password: ''),
   
    this.googleSignState = RequestState.stable,
    this.googleSignMessage = '',
    this.googleUserData = const UserEntity(email: '', password: ''),
    
  });
  SocialSignState copyWith({
    // Sign with Facebook
    RequestState? facebookSignState,
    String? facebookSignMessage,
    UserEntity? facebookUserData,

    // Sign with Google
    RequestState? googleSignState,
    String? googleSignMessage,
    UserEntity? googleUserData,


  }) {
    return SocialSignState(
      facebookSignState: facebookSignState ?? this.facebookSignState,
      facebookSignMessage: facebookSignMessage ?? this.facebookSignMessage,
      facebookUserData: facebookUserData ?? this.facebookUserData,
    
      googleSignState: googleSignState ?? this.googleSignState,
      googleSignMessage: googleSignMessage ?? this.googleSignMessage,
      googleUserData: googleUserData ?? this.googleUserData,

    );
  }

  @override
  List<Object> get props => [
        facebookSignState,
        facebookSignMessage,
        facebookUserData,
      
        googleSignState,
        googleSignMessage,
        googleUserData,
      
      ];
}
