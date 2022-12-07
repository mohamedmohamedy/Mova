import 'package:dartz/dartz.dart';
import '../../../../core/global/base_use_case.dart';
import '../../../../core/network/failure.dart';
import '../repositories/base_regular_authentication_repository.dart';

class VerifyUserUseCase extends BaseUseCase<bool, NoParameters> {
  final BaseRegularAuthenticationRepository _repository;

  VerifyUserUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async {
    return await _repository.verifyUser();
  }
}
