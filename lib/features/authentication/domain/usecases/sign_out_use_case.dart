import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/authentication/domain/repositories/base_authentication_repository.dart';

class SignOutUseCase extends BaseUseCase<Unit, NoParameters> {
  BaseAuthenticationRepository repository;
  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParameters parameters) async {
    return await repository.signOut();
  }
}
