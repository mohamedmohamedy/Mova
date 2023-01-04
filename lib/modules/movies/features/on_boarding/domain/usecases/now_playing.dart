import 'package:dartz/dartz.dart';
import '../../../../../../core/global/base_use_case.dart';
import '../../../../../../core/network/failure.dart';
import '../../../../common_utils/common_entities/movie.dart';
import '../repositories/now_playing.dart';

class NowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseGetNowPlayingMovieRepository _repository;

  NowPlayingMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async =>
    await  _repository.getNowPlayingMovies();
}
