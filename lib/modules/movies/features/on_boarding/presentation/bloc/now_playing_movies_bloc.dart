import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/global/base_use_case.dart';
import '../../../../../../core/utils/request_state.dart';
import '../../../../common_utils/common_entities/movie.dart';
import '../../domain/usecases/now_playing.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final NowPlayingMoviesUseCase _nowPlayingMoviesUseCase;
  NowPlayingMoviesBloc(this._nowPlayingMoviesUseCase)
      : super(const NowPlayingMoviesState()) {
    on<NowPlayingMoviesEvent>(_getNowPlayingMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      NowPlayingMoviesEvent event, Emitter<NowPlayingMoviesState> emit) async {
    final result = await _nowPlayingMoviesUseCase(const NoParameters());

    result.fold(
      (failure) => emit(state.copyWith(
        getNowPlayingMoviesState: RequestState.error,
        getNowPlayingMoviesMessage: failure.errorMessage,
      )),
      (moviesData) => emit(state.copyWith(
        getNowPlayingMoviesState: RequestState.success,
        getNowPlayingMoviesData: moviesData,
      )),
    );
  }
}
