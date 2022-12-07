import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../entities/user.dart';

abstract class BaseRegularAuthenticationRepository {
  Future<Either<Failure, Unit>> signIn(UserEntity user);
  Future<Either<Failure, Unit>> signUp(UserEntity user);
  Future<Either<Failure, Unit>> resetPassword(String email);
  Future<Either<Failure, bool>> verifyUser();
}



