import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/core/network/exceptions.dart';
import 'package:mova/core/network/network_info.dart';
import 'package:mova/features/authentication/data/datasources/authentication_data_source.dart';
import 'package:mova/features/authentication/data/models/user_model.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';
import 'package:mova/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mova/features/authentication/domain/repositories/base_authentication_repository.dart';

import '../../../../core/global/type_def.dart';
import '../datasources/authentication_local_data_source.dart';

class AuthenticationRepository implements BaseAuthenticationRepository {
  final BaseNetworkInfo deviceStatus;
  final BaseAuthenticationDataSource dataSource;
  final BaseLocalDataSource _localDataSource;

  AuthenticationRepository(
      this.deviceStatus, this.dataSource, this._localDataSource);

  //_________________________Sign in___________________________________________
  @override
  Future<Either<Failure, Unit>> signIn(UserEntity user) async {
    UserModel userModel = UserModel(email: user.email, password: user.password);
    return await _signMethod(() => dataSource.signIn(userModel));
  }

  //_________________________Sign up___________________________________________
  @override
  Future<Either<Failure, Unit>> signUp(UserEntity user) async {
    UserModel userModel = UserModel(email: user.email, password: user.password);
    return await _signMethod(() => dataSource.signUp(userModel));
  }

  //_________________________Sign out___________________________________________
  @override
  Future<Either<Failure, Unit>> signOut() async {
    return await _signMethod(() => dataSource.signOut());
  }

  //________________________________common method_______________________________
  Future<Either<Failure, Unit>> _signMethod(FutureFunction wantedMethod) async {
    if (await deviceStatus.isConnected) {
      try {
        await wantedMethod();
        return const Right(unit);
      } on FirebaseAuthException catch (error) {
        return Left(
          ServerFailure(
              errorMessage:
                  error.message ?? StringsManager.serverFailureMessage),
        );
      }
    } else {
      return const Left(
          OfflineFailure(errorMessage: StringsManager.offlineFailureMessage));
    }
  }

  //__________________________________Verify user__________________________________
  @override
  Future<Either<Failure, bool>> verifyUser() async {
    if (await deviceStatus.isConnected) {
      try {
        final response = await dataSource.verifyUser();
        return Right(response);
      } on FirebaseAuthException catch (error) {
        return Left(
          ServerFailure(
              errorMessage:
                  error.message ?? StringsManager.serverFailureMessage),
        );
      }
    } else {
      return const Left(
          OfflineFailure(errorMessage: StringsManager.offlineFailureMessage));
    }
  }

  @override
  //__________________________________Cache user email__________________________________
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

  //__________________________________Get Cached user email__________________________________
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
