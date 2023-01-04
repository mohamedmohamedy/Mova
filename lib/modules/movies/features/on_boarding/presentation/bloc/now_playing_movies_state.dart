part of 'now_playing_movies_bloc.dart';

class NowPlayingMoviesState extends Equatable {
  final RequestState getNowPlayingMoviesState;
  final String getNowPlayingMoviesMessage;
  final List<Movie> getNowPlayingMoviesData;

  const NowPlayingMoviesState({
    this.getNowPlayingMoviesState = RequestState.loading,
    this.getNowPlayingMoviesMessage = '',
    this.getNowPlayingMoviesData = const [],
  });

  NowPlayingMoviesState copyWith(
          {List<Movie>? getNowPlayingMoviesData,
          RequestState? getNowPlayingMoviesState,
          String? getNowPlayingMoviesMessage}) =>
      NowPlayingMoviesState(
        getNowPlayingMoviesMessage:
            getNowPlayingMoviesMessage ?? this.getNowPlayingMoviesMessage,
        getNowPlayingMoviesData:
            getNowPlayingMoviesData ?? this.getNowPlayingMoviesData,
        getNowPlayingMoviesState:
            getNowPlayingMoviesState ?? this.getNowPlayingMoviesState,
      );

  @override
  List<Object> get props => [
        getNowPlayingMoviesData,
        getNowPlayingMoviesMessage,
        getNowPlayingMoviesState,
      ];
}
