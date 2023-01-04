part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetWeekTrendingMoviesEvent extends HomeEvent {
  final int pageKey;
  const GetWeekTrendingMoviesEvent({required this.pageKey});
}

class GetUpcomingMoviesEvent extends HomeEvent {
  final int pageKey;
  const GetUpcomingMoviesEvent({required this.pageKey});
}

class GetPopularMoviesEvent extends HomeEvent {
  final int pageKey;
  const GetPopularMoviesEvent({required this.pageKey});
}
