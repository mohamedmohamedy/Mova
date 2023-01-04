import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dependency_container.dart' as di;

import '../../modules/authentication/presentation/bloc/caching_user_data/caching_user_data_bloc.dart';
import '../../modules/authentication/presentation/bloc/phone_number_sign/phone_number_sign_bloc.dart';
import '../../modules/authentication/presentation/bloc/regular_sign/authentication_bloc.dart';
import '../../modules/authentication/presentation/bloc/social_sign/social_sign_bloc.dart';
import '../../modules/movies/features/home/presentation/bloc/home_bloc.dart';
import '../../modules/movies/features/on_boarding/presentation/bloc/now_playing_movies_bloc.dart';

class BlocProviders {
  static dynamic blocProviders = [
    BlocProvider(create: (_) => di.sl<HomeBloc>()),
    BlocProvider(create: (_) => di.sl<NowPlayingMoviesBloc>()),
    BlocProvider(create: (_) => di.sl<CachingUserDataBloc>()),
    BlocProvider(create: (_) => di.sl<PhoneNumberSignBloc>()),
    BlocProvider(create: (_) => di.sl<AuthenticationBloc>()),
    BlocProvider(create: (_) => di.sl<SocialSignBloc>()),
  ];
}
