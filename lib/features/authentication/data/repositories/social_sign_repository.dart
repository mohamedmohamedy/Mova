import 'package:mova/features/authentication/domain/repositories/base_social_sign_repository.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/core/network/network_info.dart';
import 'package:mova/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';
import 'package:mova/core/network/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/global/type_def.dart';

class SocialSignRepository implements BaseSocialSignRepository {
  final BaseNetworkInfo _deviceStatus;
  final BaseAuthenticationRemoteDataSource _dataSource;

  const SocialSignRepository(this._deviceStatus, this._dataSource);

  //_________________________Sign with Facebook__________________________________
  @override
  Future<Either<Failure, UserEntity>> signWithFacebook() async {
    return await _socialSignMethod(() => _dataSource.signWithFacebook());
  }

  //_____________________________Sign with Google__________________________________
  @override
  Future<Either<Failure, UserEntity>> signWithGoogle() async {
    return await _socialSignMethod(() => _dataSource.signWithGoogle());
  }

  //______________________________common social sign method_____________________________
  Future<Either<Failure, UserEntity>> _socialSignMethod(
      SocialFunction socialSignFunction) async {
    if (await _deviceStatus.isConnected) {
      try {
        final response = await socialSignFunction();
        return Right(response);
      } on FirebaseAuthException catch (error) {
        return Left(ServerFailure(
            errorMessage:
                error.message ?? StringsManager.serverFailureMessage));
      } catch (error) {
        return const Left(
            ServerFailure(errorMessage: StringsManager.serverFailureMessage));
      }
    } else {
      return const Left(
          OfflineFailure(errorMessage: StringsManager.offlineFailureMessage));
    }
  }
}
