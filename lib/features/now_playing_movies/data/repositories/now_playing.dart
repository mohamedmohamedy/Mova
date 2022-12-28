import 'package:mova/core/network/exceptions.dart';
import 'package:mova/core/network/network_info.dart';
import 'package:mova/features/now_playing_movies/data/datasources/now_playing.dart';
import 'package:mova/features/now_playing_movies/domain/entities/movie.dart';
import 'package:mova/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mova/features/now_playing_movies/domain/repositories/now_playing.dart';

import '../../../../core/resources/strings_manager.dart';

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
