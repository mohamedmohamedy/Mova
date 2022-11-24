import 'package:dartz/dartz.dart';
import 'package:mova/features/authentication/domain/entities/user.dart';

import '../../features/authentication/presentation/bloc/authentication_bloc.dart';

typedef FutureFunction = Future<Unit> Function();
typedef SocialFunction = Future<UserEntity> Function();
typedef AuthenticationEventFunction = AuthenticationEvent Function(
    String, String);
