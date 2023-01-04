import 'package:mova/core/global/type_def.dart';
import 'package:mova/core/network/exceptions.dart';
import 'package:mova/core/network/network_info.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mova/modules/movies/common_utils/common_entities/movies.dart';
import 'package:mova/modules/movies/features/home/data/datasources/home_data_source.dart';
import 'package:mova/modules/movies/features/home/domain/repositories/home_base_repository.dart';

class HomeMoviesRepository implements BaseHomeRepository {
  final BaseNetworkInfo _networkInfo;
  final BaseHomeDataSource _homeDataSource;

  const HomeMoviesRepository(this._networkInfo, this._homeDataSource);

  @override
  Future<Either<Failure, Movies>> getWeekTrendingMovies(int pageKey) async {
    return await _repoMethod(
        () => _homeDataSource.getWeekTrendingMovies(pageKey));
  }

  @override
  Future<Either<Failure, Movies>> getUpcomingMovies(int pageKey) async {
    return await _repoMethod(() => _homeDataSource.getUpcomingMovies(pageKey));
  }

  @override
  Future<Either<Failure, Movies>> getPopularMovies(int pageKey) async {
    return await _repoMethod(() => _homeDataSource.getPopularMovies(pageKey));
  }

  Future<Either<Failure, Movies>> _repoMethod(
    MoviesRepoFunction wantedFunction,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await wantedFunction();
        return Right(result);
      } on PrimaryServerException catch (error) {
        return Left(
          ServerFailure(errorMessage: error.message),
        );
      }
    } else {
      return const Left(
        OfflineFailure(errorMessage: StringsManager.offlineFailureMessage),
      );
    }
  }
}
