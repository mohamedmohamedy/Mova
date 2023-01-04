import 'package:dartz/dartz.dart';

import '../../../../../../core/network/exceptions.dart';
import '../../../../../../core/network/failure.dart';
import '../../../../../../core/network/network_info.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../../common_utils/common_entities/movie.dart';
import '../../domain/repositories/now_playing.dart';
import '../datasources/now_playing.dart';

class NowPlayingMoviesRepository implements BaseGetNowPlayingMovieRepository {
  final BaseNetworkInfo _networkInfo;
  final BaseNowPlayingMoviesDataSource _nowPlayingMoviesDataSource;

  const NowPlayingMoviesRepository(
      this._networkInfo, this._nowPlayingMoviesDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _nowPlayingMoviesDataSource.getNowPlying();
        return Right(result);
      } on PrimaryServerException catch (error) {
        return Left(ServerFailure(errorMessage: error.message));
      }
    } else {
      return const Left(
          OfflineFailure(errorMessage: StringsManager.offlineFailureMessage));
    }
  }
}
