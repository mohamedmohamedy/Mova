import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mova/core/network/dio_helper.dart';
import 'package:mova/features/now_playing_movies/data/datasources/now_playing.dart';
import 'package:mova/features/now_playing_movies/data/repositories/now_playing.dart';
import 'package:mova/features/now_playing_movies/domain/repositories/now_playing.dart';
import 'package:mova/features/now_playing_movies/domain/usecases/now_playing.dart';
import 'package:mova/features/now_playing_movies/presentation/bloc/now_playing_movies_bloc.dart';
import 'core/network/network_info.dart';
import 'features/authentication/data/datasources/base_authentication_remote_data_source.dart';
import 'features/authentication/data/datasources/authentication_local_data_source.dart';
import 'features/authentication/data/repositories/caching_user_data_repository.dart';
import 'features/authentication/data/repositories/regular_authentication_repository.dart';
import 'features/authentication/data/repositories/sign_with_phone_number_repository.dart';
import 'features/authentication/data/repositories/social_sign_repository.dart';
import 'features/authentication/domain/repositories/base_caching_user_data_repository.dart';
import 'features/authentication/domain/repositories/base_regular_authentication_repository.dart';
import 'features/authentication/domain/repositories/base_sign_with_phone_number_repository.dart';
import 'features/authentication/domain/repositories/base_social_sign_repository.dart';
import 'features/authentication/domain/usecases/cache_user_use_case.dart';
import 'features/authentication/domain/usecases/delete_user_cached_data_use_case.dart';
import 'features/authentication/domain/usecases/get_cached_user_use_case.dart';
import 'features/authentication/domain/usecases/otp_verification_use_case.dart';
import 'features/authentication/domain/usecases/sign_in_use_case.dart';
import 'features/authentication/domain/usecases/sign_with_facebook_use_case.dart';
import 'features/authentication/domain/usecases/sign_with_phone_number.dart';
import 'features/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';
import 'features/authentication/presentation/bloc/phone_number_sign/phone_number_sign_bloc.dart';
import 'features/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/authentication/domain/usecases/reset_password_use_case.dart';
import 'features/authentication/domain/usecases/sign_up_use_case.dart';
import 'features/authentication/domain/usecases/sign_with_google.dart';
import 'features/authentication/domain/usecases/verify_user_use_case.dart';
import 'features/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// BLoC
  sl.registerFactory(() => AuthenticationBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => CachingUserDataBloc(sl(), sl(), sl()));
  sl.registerFactory(() => PhoneNumberSignBloc(sl(), sl()));
  sl.registerFactory(() => SocialSignBloc(sl(), sl()));
  sl.registerFactory(() => NowPlayingMoviesBloc(sl()));

  /// Use cases
  sl.registerLazySingleton(() => DeleteUserCachedDataUseCase(sl()));
  sl.registerLazySingleton(() => SignWithPhoneNumberUseCase(sl()));
  sl.registerLazySingleton(() => SignWithFacebookUseCase(sl()));
  sl.registerLazySingleton(() => NowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => OtpVerificationUseCase(sl()));
  sl.registerLazySingleton(() => SignWithGoogleUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => VerifyUserUseCase(sl()));
  sl.registerLazySingleton(() => CacheUserUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<BaseRegularAuthenticationRepository>(
      () => AuthenticationRepository(sl(), sl()));
  sl.registerLazySingleton<BaseSocialSignRepository>(
      () => SocialSignRepository(sl(), sl()));
  sl.registerLazySingleton<BaseCachingUserDataRepository>(
      () => CachingUserDataRepository(sl(), sl()));
  sl.registerLazySingleton<BaseSignWithPhoneNumberRepository>(
      () => SignWithPhoneNumberRepository(sl(), sl()));

  sl.registerLazySingleton<BaseGetNowPlayingMovieRepository>(
      () => NowPlayingMoviesRepository(sl(), sl()));

  /// Data sources
  sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource());
  sl.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());
  sl.registerLazySingleton<BaseNowPlayingMoviesDataSource>(
      () => NowPlayingMoviesDataSource(sl()));

  /// External
  sl.registerLazySingleton<BaseDioHelper>(() => DioHelper());
  sl.registerLazySingleton(() => FirebaseAuth);
  // sl.registerLazySingleton(() => FacebookAuth);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<BaseNetworkInfo>(() => NetworkInfo(sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
