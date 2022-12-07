import 'package:dartz/dartz.dart';
import '../../../../core/global/base_use_case.dart';
import '../../../../core/network/failure.dart';
import '../repositories/base_sign_with_phone_number_repository.dart';

class OtpVerificationUseCase extends BaseUseCase<Unit, String> {
  final BaseSignWithPhoneNumberRepository _repository;

   OtpVerificationUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String parameters) async =>
      await _repository.verifyOtp(parameters);
}
