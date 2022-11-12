import 'package:dartz/dartz.dart';

import '../../features/authentication/presentation/bloc/authentication_bloc.dart';

typedef FutureFunction = Future<Unit> Function();
typedef AuthenticationEventFunction = AuthenticationEvent Function(
    String, String);
