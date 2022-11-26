import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';

import '../repositories/base_social_sign_repository.dart';

class SignWithGoogleUseCase extends BaseUseCase<UserEntity, NoParameters> {
  final BaseSocialSignRepository _repository;
  SignWithGoogleUseCase(this._repository);
  @override
  Future<Either<Failure, UserEntity>> call(NoParameters parameters) async {
    return await _repository.signWithGoogle();
  }
}
