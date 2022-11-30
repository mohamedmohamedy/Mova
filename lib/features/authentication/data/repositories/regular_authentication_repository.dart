import 'package:firebase_auth/firebase_auth.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/core/network/network_info.dart';
import 'package:mova/features/authentication/data/datasources/base_authentication_remote_data_source.dart';
import 'package:mova/features/authentication/data/models/user_model.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';
import 'package:mova/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mova/features/authentication/domain/repositories/base_regular_authentication_repository.dart';

import '../../../../core/global/type_def.dart';

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

  //____________________________Sign up_______________________________________
  @override
  Future<Either<Failure, Unit>> signUp(UserEntity user) async {
    UserModel userModel = UserModel(email: user.email, password: user.password);
    return await _signMethod(() => _dataSource.signUp(userModel));
  }

  //__________________________________Verify user__________________________________
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
