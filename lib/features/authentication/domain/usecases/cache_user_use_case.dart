import 'package:dartz/dartz.dart';
import 'package:mova/core/global/base_use_case.dart';
import 'package:mova/core/network/failure.dart';
import 'package:mova/features/authentication/domain/repositories/base_authentication_repository.dart';

class CacheUserUseCase extends BaseUseCase<Unit, String> {
  final BaseAuthenticationRepository _repository;
  CacheUserUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String parameters) async {
    return await _repository.cacheUser(parameters);
  }
}
