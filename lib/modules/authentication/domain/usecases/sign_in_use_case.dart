import 'package:dartz/dartz.dart';
import '../../../../core/global/base_use_case.dart';
import '../../../../core/network/failure.dart';
import '../entities/user.dart';
import '../repositories/base_regular_authentication_repository.dart';

class SignInUseCase extends BaseUseCase<Unit, UserEntity> {
final BaseRegularAuthenticationRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(UserEntity parameters) async {
    return await _repository.signIn(parameters);
  }
}
