import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/global/type_def.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/base_regular_authentication_repository.dart';
import '../datasources/base_authentication_remote_data_source.dart';
import '../models/user_model.dart';

class AuthenticationRepository implements BaseRegularAuthenticationRepository {
  final BaseNetworkInfo _deviceStatus;
  final BaseAuthenticationRemoteDataSource _dataSource;
  const AuthenticationRepository(this._deviceStatus, this._dataSource);

  //_____________________________Sign in___________________________________
  @override
  Future<Either<Failure, Unit>> signIn(UserEntity user) async {
    UserModel userModel = UserModel(email: user.email, password: user.password);
    return await _signMethod(() => _dataSource.signIn(userModel));
  }

  //____________________________Sign up_____________________________________
  @override
  Future<Either<Failure, Unit>> signUp(UserEntity user) async {
    UserModel userModel = UserModel(email: user.email, password: user.password);
    return await _signMethod(() => _dataSource.signUp(userModel));
  }

  //____________________________Reset password_____________________________________
  @override
  Future<Either<Failure, Unit>> resetPassword(String email) async =>
      await _signMethod(() => _dataSource.resetPassword(email));
      
  //____________________________Verify user__________________________________
  @override
  Future<Either<Failure, bool>> verifyUser() async {
    if (await _deviceStatus.isConnected) {
      try {
        final response = await _dataSource.verifyUser();
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

  //_________________common sign with email and password method____________________
  Future<Either<Failure, Unit>> _signMethod(FutureFunction wantedMethod) async {
    if (await _deviceStatus.isConnected) {
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
}
