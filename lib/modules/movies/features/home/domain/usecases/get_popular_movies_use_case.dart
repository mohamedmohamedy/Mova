import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/modules/movies/common_utils/common_entities/movie.dart';
import 'package:mova/modules/movies/common_utils/common_entities/movies.dart';
import 'package:mova/modules/movies/features/home/domain/repositories/home_base_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<Movies, int> {
  final BaseHomeRepository _repository;

  GetPopularMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, Movies>> call(int parameters) async =>
      await _repository.getPopularMovies(parameters);
}
