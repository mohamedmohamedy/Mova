import 'package:dartz/dartz.dart';
import '../../../../core/global/base_use_case.dart';
import '../../../../core/network/failure.dart';
import '../repositories/base_regular_authentication_repository.dart';

class ResetPasswordUseCase extends BaseUseCase<Unit, String> {
  final BaseRegularAuthenticationRepository _repository;

  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String parameters) async =>
      await _repository.resetPassword(parameters);
}
