import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/core/network/exceptions.dart';
import 'package:mova/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mova/features/authentication/domain/repositories/base_caching_user_data_repository.dart';

import '../datasources/authentication_local_data_source.dart';

class CachingUserDataRepository implements BaseCachingUserDataRepository {
  final BaseLocalDataSource _localDataSource;
  
  const CachingUserDataRepository(this._localDataSource);

  //__________________________________Cache user email__________________________________
  @override
  Future<Either<Failure, Unit>> cacheUser(String userEmail) async {
    try {
      await _localDataSource.cacheUser(userEmail);
      return const Right(unit);
    } catch (error) {
      return const Left(
        UnknownCachingFailure(
            errorMessage: StringsManager.unknownCachingFailureMessage),
      );
    }
  }

  //__________________________________Get Cached user email________________________________
  @override
  Future<Either<Failure, Unit>> getCacheUser() async {
    try {
      await _localDataSource.getCachedUser();
      return const Right(unit);
    } on EmptyCacheException {
      return const Left(
        EmptyCacheFailure(
            errorMessage: StringsManager.emptyCacheFailureMessage),
      );
    }
  }
}
