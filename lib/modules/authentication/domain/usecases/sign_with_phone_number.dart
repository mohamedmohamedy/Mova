import 'package:dartz/dartz.dart';
import '../../../../core/global/base_use_case.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/utils/request_state.dart';
import '../repositories/base_sign_with_phone_number_repository.dart';

class SignWithPhoneNumberUseCase extends BaseUseCase<PhoneAuthState, String> {
  final BaseSignWithPhoneNumberRepository _repository;

  SignWithPhoneNumberUseCase(this._repository);

  @override
  Future<Either<Failure, PhoneAuthState>> call(String parameters) async =>
      await _repository.signWithPhoneNumber(parameters);
}
