part of 'home_bloc.dart';

class HomeState extends Equatable {
  // Popular movies
  final RequestState getWeekTrendingMoviesState;
  final String getWeekTrendingMoviesMessage;
  final Movies getWeekTrendingMoviesData;

  // Upcoming movies
  final RequestState getUpcomingMoviesState;
  final String getUpcomingMoviesMessage;
  final Movies getUpcomingMoviesData;

  // Popular movies
  final RequestState getPopularMoviesState;
  final String getPopularMoviesMessage;
  final Movies getPopularMoviesData;

  const HomeState({
    // Popular movies
    this.getWeekTrendingMoviesState = RequestState.loading,
    this.getWeekTrendingMoviesMessage = '',
    this.getWeekTrendingMoviesData =
        const Movies(moviesList: [], pageNumber: 1),

    // Upcoming movies
    this.getUpcomingMoviesState = RequestState.loading,
    this.getUpcomingMoviesMessage = '',
    this.getUpcomingMoviesData = const Movies(moviesList: [], pageNumber: 1),

    // Popular movies
    this.getPopularMoviesState = RequestState.loading,
    this.getPopularMoviesMessage = '',
    this.getPopularMoviesData = const Movies(moviesList: [], pageNumber: 1),
  });

  HomeState copyWith({
    // Popular movies
    RequestState? getWeekTrendingMoviesState,
    String? getWeekTrendingMoviesMessage,
    Movies? getWeekTrendingMoviesData,

    // Upcoming movies
    RequestState? getUpcomingMoviesState,
    String? getUpcomingMoviesMessage,
    Movies? getUpcomingMoviesData,

    // Popular movies
    RequestState? getPopularMoviesState,
    String? getPopularMoviesMessage,
    Movies? getPopularMoviesData,
  }) =>
      HomeState(
        // Popular movies
        getWeekTrendingMoviesState:
            getWeekTrendingMoviesState ?? this.getWeekTrendingMoviesState,
        getWeekTrendingMoviesMessage:
            getWeekTrendingMoviesMessage ?? this.getWeekTrendingMoviesMessage,
        getWeekTrendingMoviesData:
            getWeekTrendingMoviesData ?? this.getWeekTrendingMoviesData,

        // Upcoming movies
        getUpcomingMoviesState:
            getUpcomingMoviesState ?? this.getUpcomingMoviesState,
        getUpcomingMoviesMessage:
            getUpcomingMoviesMessage ?? this.getUpcomingMoviesMessage,
        getUpcomingMoviesData:
            getUpcomingMoviesData ?? this.getUpcomingMoviesData,

        // Popular movies
        getPopularMoviesState: getPopularMoviesState ?? this.getPopularMoviesState,
        getPopularMoviesMessage:
            getPopularMoviesMessage ?? this.getPopularMoviesMessage,
        getPopularMoviesData: getPopularMoviesData ?? this.getPopularMoviesData,
      );

  @override
  List<Object> get props => [
        // Popular movies
        getWeekTrendingMoviesState,
        getWeekTrendingMoviesMessage,
        getWeekTrendingMoviesData,
       
        // Upcoming movies
        getUpcomingMoviesState,
        getUpcomingMoviesMessage,
        getUpcomingMoviesData,
        
        // Popular movies
        getPopularMoviesState,
        getPopularMoviesMessage,
        getPopularMoviesData,
      ];
}
