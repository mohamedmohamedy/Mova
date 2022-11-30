import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';
import 'package:mova/features/authentication/domain/repositories/base_regular_authentication_repository.dart';

class SignInUseCase extends BaseUseCase<Unit, UserEntity> {
final BaseRegularAuthenticationRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(UserEntity parameters) async {
    return await _repository.signIn(parameters);
  }
}
