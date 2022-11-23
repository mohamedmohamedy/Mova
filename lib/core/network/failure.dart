import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class OfflineFailure extends Failure {
  const OfflineFailure({required super.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({required super.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class UnknownCachingFailure extends Failure {
  const UnknownCachingFailure({required super.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
