import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/resources/routes.dart';
import '../../../../../../core/utils/loading_indicator_util.dart';
import '../../../../../../core/utils/request_state.dart';

import '../bloc/now_playing_movies_bloc.dart';
import '../widgets/now_playing_movies_widget.dart';
import '../widgets/slider_widget.dart';

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NowPlayingMoviesBloc>(context)
        .add(GetNowPlayingMoviesEvent());
    return Scaffold(
      body: BlocConsumer<NowPlayingMoviesBloc, NowPlayingMoviesState>(
        listenWhen: (previous, current) =>
            previous.getNowPlayingMoviesState !=
            current.getNowPlayingMoviesState,
        listener: (context, state) {
          if (state.getNowPlayingMoviesState == RequestState.error) {
            Navigator.of(context).pushReplacementNamed(Routes.errorScreenKey,
                arguments: state.getNowPlayingMoviesMessage);
          }
        },
        buildWhen: (previous, current) =>
            previous.getNowPlayingMoviesState !=
            current.getNowPlayingMoviesState,
        builder: (context, state) {
          if (state.getNowPlayingMoviesState == RequestState.loading) {
            return const LoadingIndicatorUtil();
          }
          return Stack(children: [
            NowPlayingMoviesWidget(moviesList: state.getNowPlayingMoviesData),
            const SliderWidget(),
          ]);
        },
      ),
    );
  }
}
