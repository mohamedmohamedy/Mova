import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mova/modules/movies/features/home/data/datasources/home_data_source.dart';
import 'package:mova/modules/movies/features/home/data/repositories/home_movies_repository.dart';
import 'package:mova/modules/movies/features/home/domain/repositories/home_base_repository.dart';
import 'package:mova/modules/movies/features/home/domain/usecases/get_week_trending_movies_use_case.dart';
import 'package:mova/modules/movies/features/home/presentation/bloc/home_bloc.dart';
import 'core/network/dio_helper.dart';
import 'core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/authentication/data/datasources/authentication_local_data_source.dart';
import 'modules/authentication/data/datasources/base_authentication_remote_data_source.dart';
import 'modules/authentication/data/repositories/caching_user_data_repository.dart';
import 'modules/authentication/data/repositories/regular_authentication_repository.dart';
import 'modules/authentication/data/repositories/sign_with_phone_number_repository.dart';
import 'modules/authentication/data/repositories/social_sign_repository.dart';
import 'modules/authentication/domain/repositories/base_caching_user_data_repository.dart';
import 'modules/authentication/domain/repositories/base_regular_authentication_repository.dart';
import 'modules/authentication/domain/repositories/base_sign_with_phone_number_repository.dart';
import 'modules/authentication/domain/repositories/base_social_sign_repository.dart';
import 'modules/authentication/domain/usecases/cache_user_use_case.dart';
import 'modules/authentication/domain/usecases/delete_user_cached_data_use_case.dart';
import 'modules/authentication/domain/usecases/get_cached_user_use_case.dart';
import 'modules/authentication/domain/usecases/otp_verification_use_case.dart';
import 'modules/authentication/domain/usecases/reset_password_use_case.dart';
import 'modules/authentication/domain/usecases/sign_in_use_case.dart';
import 'modules/authentication/domain/usecases/sign_up_use_case.dart';
import 'modules/authentication/domain/usecases/sign_with_facebook_use_case.dart';
import 'modules/authentication/domain/usecases/sign_with_google.dart';
import 'modules/authentication/domain/usecases/sign_with_phone_number.dart';
import 'modules/authentication/domain/usecases/verify_user_use_case.dart';
import 'modules/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';
import 'modules/authentication/presentation/bloc/phone_number_sign/phone_number_sign_bloc.dart';
import 'modules/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';
import 'modules/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';
import 'modules/movies/features/home/domain/usecases/get_popular_movies_use_case.dart';
import 'modules/movies/features/home/domain/usecases/get_upcoming_movies_use_case.dart';
import 'modules/movies/features/on_boarding/data/datasources/now_playing.dart';
import 'modules/movies/features/on_boarding/data/repositories/now_playing.dart';
import 'modules/movies/features/on_boarding/domain/repositories/now_playing.dart';
import 'modules/movies/features/on_boarding/domain/usecases/now_playing.dart';
import 'modules/movies/features/on_boarding/presentation/bloc/now_playing_movies_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// BLoC

  // Auth Bloc
  sl.registerFactory(() => AuthenticationBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => CachingUserDataBloc(sl(), sl(), sl()));
  sl.registerFactory(() => PhoneNumberSignBloc(sl(), sl()));
  sl.registerFactory(() => SocialSignBloc(sl(), sl()));

  // Onboarding bloc
  sl.registerFactory(() => NowPlayingMoviesBloc(sl()));

  // Home Bloc
  sl.registerFactory(() => HomeBloc(sl(), sl(), sl()));

  /// Use cases

  // Auth Use cases
  sl.registerLazySingleton(() => DeleteUserCachedDataUseCase(sl()));
  sl.registerLazySingleton(() => SignWithPhoneNumberUseCase(sl()));
  sl.registerLazySingleton(() => SignWithFacebookUseCase(sl()));
  sl.registerLazySingleton(() => OtpVerificationUseCase(sl()));
  sl.registerLazySingleton(() => SignWithGoogleUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => VerifyUserUseCase(sl()));
  sl.registerLazySingleton(() => CacheUserUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  // Onboarding use case
  sl.registerLazySingleton(() => NowPlayingMoviesUseCase(sl()));

  // Home use cases

  sl.registerLazySingleton(() => GetWeekTrendingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetUpcomingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

  /// Repository

  // Auth repository
  sl.registerLazySingleton<BaseRegularAuthenticationRepository>(
      () => AuthenticationRepository(sl(), sl()));
  sl.registerLazySingleton<BaseSocialSignRepository>(
      () => SocialSignRepository(sl(), sl()));
  sl.registerLazySingleton<BaseCachingUserDataRepository>(
      () => CachingUserDataRepository(sl(), sl()));
  sl.registerLazySingleton<BaseSignWithPhoneNumberRepository>(
      () => SignWithPhoneNumberRepository(sl(), sl()));

  // Onboarding repository
  sl.registerLazySingleton<BaseGetNowPlayingMovieRepository>(
      () => NowPlayingMoviesRepository(sl(), sl()));

  // Home repository
  sl.registerLazySingleton<BaseHomeRepository>(
      () => HomeMoviesRepository(sl(), sl()));

  /// Data sources

  // Auth data sources
  sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource());
  sl.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());

  // Onboarding data sources
  sl.registerLazySingleton<BaseNowPlayingMoviesDataSource>(
      () => NowPlayingMoviesDataSource(sl()));

  // Home data sources
  sl.registerLazySingleton<BaseHomeDataSource>(() => HomeDataSourceByDio(sl()));

  /// External
  sl.registerLazySingleton<BaseDioHelper>(() => DioHelper());
  sl.registerLazySingleton(() => FirebaseAuth);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<BaseNetworkInfo>(() => NetworkInfo(sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
