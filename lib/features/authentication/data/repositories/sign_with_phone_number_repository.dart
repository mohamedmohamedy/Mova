import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/base_sign_with_phone_number_repository.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/request_state.dart';
import '../datasources/base_authentication_remote_data_source.dart';

 class SignWithPhoneNumberRepository implements BaseSignWithPhoneNumberRepository { 
  final BaseNetworkInfo _deviceStatus;
  final BaseAuthenticationRemoteDataSource _dataSource;

  const SignWithPhoneNumberRepository(this._deviceStatus, this._dataSource);

  //________________________sign with phone number___________________________________
  @override
  Future<Either<Failure, PhoneAuthState>> signWithPhoneNumber(
      String phoneNumber) async {
    if (await _deviceStatus.isConnected) {
      try {
        final response = await _dataSource.signWithPhoneNumber(phoneNumber);
        return Right(response);
      } on FirebaseAuthException catch (error) {
        return Left(ServerFailure(errorMessage: error.message!));
      } catch (error) {
        return const Left(
            ServerFailure(errorMessage: StringsManager.serverFailureMessage));
      }
    } else {
      return const Left(
          OfflineFailure(errorMessage: StringsManager.offlineFailureMessage));
    }
  }

  //________________________Verify Otp___________________________________
  @override
  Future<Either<Failure, Unit>> verifyOtp(String code) async {
    if (await _deviceStatus.isConnected) {
      try {
        final response = await _dataSource.otpVerify(code);
        return Right(response);
      } on FirebaseAuthException catch (error) {
        return Left(ServerFailure(errorMessage: error.message!));
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
