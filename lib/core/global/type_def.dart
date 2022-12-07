import 'package:dartz/dartz.dart';
import '../../features/authentication/domain/entities/user.dart';

import '../../features/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';

typedef FutureFunction = Future<Unit> Function();
typedef SocialFunction = Future<UserEntity> Function();
typedef AuthenticationEventFunction = AuthenticationEvent Function(
    String, String);
