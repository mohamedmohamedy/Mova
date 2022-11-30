import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/authentication/domain/repositories/base_regular_authentication_repository.dart';

class VerifyUserUseCase extends BaseUseCase<bool, NoParameters> {
  final BaseRegularAuthenticationRepository _repository;

  VerifyUserUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async {
    return await _repository.verifyUser();
  }
}
