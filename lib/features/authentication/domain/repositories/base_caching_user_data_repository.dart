import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';

abstract class BaseCachingUserDataRepository {
  Future<Either<Failure, Unit>> cacheUser(String userEmail);
  Future<Either<Failure, Unit>> getCacheUser();
  Future<Either<Failure, Unit>> deleteUserCachedData();
}
