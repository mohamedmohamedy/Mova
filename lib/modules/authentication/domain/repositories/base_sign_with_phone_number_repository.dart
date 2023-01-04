import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/utils/request_state.dart';

abstract class BaseSignWithPhoneNumberRepository{
   Future<Either<Failure, PhoneAuthState>> signWithPhoneNumber(
      String phoneNumber);
  Future<Either<Failure, Unit>> verifyOtp(String code);
}