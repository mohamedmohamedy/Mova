import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/authentication/data/repositories/authentication_repository.dart';
import 'package:mova/features/authentication/domain/repositories/base_authentication_repository.dart';

class VerifyUserUseCase extends BaseUseCase<bool, NoParameters> {
  final BaseAuthenticationRepository repository;

  VerifyUserUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParameters parameters) async{
    return await repository.verifyUser();
  }
}
