import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/modules/movies/features/home/domain/repositories/home_base_repository.dart';

import '../../../../common_utils/common_entities/movies.dart';

class GetWeekTrendingMoviesUseCase extends BaseUseCase<Movies, int> {
  final BaseHomeRepository _repository;

  GetWeekTrendingMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, Movies>> call(int parameters) async =>
      await _repository.getWeekTrendingMovies(parameters);
}
