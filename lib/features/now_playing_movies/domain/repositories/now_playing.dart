import 'package:dartz/dartz.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/now_playing_movies/domain/entities/movie.dart';

abstract class BaseGetNowPlayingMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
}
