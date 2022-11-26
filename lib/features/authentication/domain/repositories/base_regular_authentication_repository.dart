import 'package:dartz/dartz.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';

import '../../../../core/network/failure.dart';

abstract class BaseRegularAuthenticationRepository {
  Future<Either<Failure, Unit>> signIn(UserEntity user);
  Future<Either<Failure, Unit>> signUp(UserEntity user);
  Future<Either<Failure, Unit>> signOut();
  Future<Either<Failure, bool>> verifyUser();
}


