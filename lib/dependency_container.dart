import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mova/core/network/network_info.dart';
import 'package:mova/features/authentication/data/datasources/authentication_data_source.dart';
import 'package:mova/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:mova/features/authentication/data/repositories/authentication_repository.dart';
import 'package:mova/features/authentication/domain/repositories/base_authentication_repository.dart';
import 'package:mova/features/authentication/domain/usecases/cache_user_use_case.dart';
import 'package:mova/features/authentication/domain/usecases/get_cached_user_use_case.dart';
import 'package:mova/features/authentication/domain/usecases/sign_in_use_case.dart';
import 'package:mova/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authentication/domain/usecases/sign_out_use_case.dart';
import 'features/authentication/domain/usecases/sign_up_use_case.dart';
import 'features/authentication/domain/usecases/verify_user_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// BLoC
  sl.registerFactory(() => AuthenticationBloc(sl(), sl(), sl(), sl(), sl(), sl()));

  /// Use cases
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => VerifyUserUseCase(sl()));
  sl.registerLazySingleton(() => CacheUserUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<BaseAuthenticationRepository>(
      () => AuthenticationRepository(sl(), sl(), sl()));

  /// Data sources
  sl.registerLazySingleton<BaseAuthenticationDataSource>(
      () => AuthenticationDataSource());
  sl.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());

  /// External
  sl.registerLazySingleton(() => FirebaseAuth);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<BaseNetworkInfo>(() => NetworkInfo(sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
