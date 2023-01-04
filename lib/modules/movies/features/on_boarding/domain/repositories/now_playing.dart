import 'package:dartz/dartz.dart';
import '../../../../../../core/network/failure.dart';
import '../../../../common_utils/common_entities/movie.dart';

abstract class BaseGetNowPlayingMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
}
