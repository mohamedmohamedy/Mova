import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mova/core/utils/request_state.dart';
import 'package:mova/modules/movies/common_utils/common_entities/movies.dart';
import 'package:mova/modules/movies/features/home/domain/usecases/get_upcoming_movies_use_case.dart';
import 'package:mova/modules/movies/features/home/domain/usecases/get_week_trending_movies_use_case.dart';

import '../../domain/usecases/get_popular_movies_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetWeekTrendingMoviesUseCase _getWeekTrendingMoviesUseCase;
  final GetUpcomingMoviesUseCase _getUpcomingMoviesUseCase;
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  HomeBloc(
    this._getPopularMoviesUseCase,
    this._getUpcomingMoviesUseCase,
    this._getWeekTrendingMoviesUseCase,
  ) : super(const HomeState()) {
    on<GetWeekTrendingMoviesEvent>(_getWeekTrendingMovies);
    on<GetUpcomingMoviesEvent>(_getUpcomingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
  }

  //__________________________Get Popular Movies________________________________
  FutureOr<void> _getWeekTrendingMovies(
      GetWeekTrendingMoviesEvent event, Emitter<HomeState> emit) async {
    final result = await _getWeekTrendingMoviesUseCase(event.pageKey);

    result.fold(
        (failure) => emit(state.copyWith(
              getWeekTrendingMoviesState: RequestState.error,
              getWeekTrendingMoviesMessage: failure.errorMessage,
            )),
        (moviesData) => emit(state.copyWith(
              getWeekTrendingMoviesState: RequestState.success,
              getWeekTrendingMoviesData: moviesData,
            )));
  }

  //__________________________Get Upcoming Movies____________________________________
  FutureOr<void> _getUpcomingMovies(
      GetUpcomingMoviesEvent event, Emitter<HomeState> emit) async {
    final result = await _getUpcomingMoviesUseCase(event.pageKey);

    result.fold(
        (failure) => emit(state.copyWith(
              getUpcomingMoviesState: RequestState.error,
              getUpcomingMoviesMessage: failure.errorMessage,
            )),
        (moviesData) => emit(state.copyWith(
              getUpcomingMoviesState: RequestState.success,
              getUpcomingMoviesData: moviesData,
            )));
  }

  //__________________________Get Popular Movies______________________________________
  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<HomeState> emit) async {
    final result = await _getPopularMoviesUseCase(event.pageKey);

    result.fold(
        (failure) => emit(state.copyWith(
              getPopularMoviesState: RequestState.error,
              getPopularMoviesMessage: failure.errorMessage,
            )),
        (moviesData) => emit(state.copyWith(
              getPopularMoviesState: RequestState.success,
              getPopularMoviesData: moviesData,
            )));
  }
}
