import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';
import 'package:mova/features/authentication/domain/repositories/base_authentication_repository.dart';

class SignWithFacebookUseCase extends BaseUseCase<UserEntity, NoParameters> {
  final BaseAuthenticationRepository _repository;
  SignWithFacebookUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParameters parameters) async {
    return await _repository.signWithFacebook();
  }
}
