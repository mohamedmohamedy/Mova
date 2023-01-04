import 'package:dartz/dartz.dart';

import '../../../../common_utils/common_entities/movies.dart';
import '../../../../../../core/network/failure.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, Movies>> getPopularMovies(int pageKey);
  Future<Either<Failure, Movies>> getWeekTrendingMovies(int pageKey);
  Future<Either<Failure, Movies>> getUpcomingMovies(int pageKey);
}
