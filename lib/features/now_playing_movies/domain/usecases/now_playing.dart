import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/now_playing_movies/domain/entities/movie.dart';
import 'package:mova/features/now_playing_movies/domain/repositories/now_playing.dart';

class NowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseGetNowPlayingMovieRepository _repository;

  NowPlayingMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async =>
    await  _repository.getNowPlayingMovies();
}
