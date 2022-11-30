import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';
import 'package:mova/features/authentication/domain/repositories/base_regular_authentication_repository.dart';

class SignUpUseCase extends BaseUseCase<Unit, UserEntity> {
  final BaseRegularAuthenticationRepository _repository;
  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(UserEntity parameters) async {
    return await _repository.signUp(parameters);
  }
}
