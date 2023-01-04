import 'package:flutter/material.dart';
import 'package:mova/core/resources/strings_manager.dart';
import 'package:mova/modules/movies/features/home/presentation/widgets/popular_movies_component.dart';
import 'package:mova/modules/movies/features/home/presentation/widgets/upcoming_movies.dart';
import 'package:mova/modules/movies/features/home/presentation/widgets/week_trending_movies.dart';

import '../widgets/in_between_texts.dart';

class HomeMoviesScreen extends StatelessWidget {
  const HomeMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(flex: 2, child: PopularMoviesComponent()),
          InBetweenHeadLines(text: StringsManager.upComing, navigation: () {}),
          const Expanded(flex: 1, child: WeekTrendingMoviesComponent()),
          InBetweenHeadLines(
              text: StringsManager.weekMovies, navigation: () {}),
          const Expanded(flex: 1, child: UpcomingMoviesComponent()),
        ],
      )),
    );
  }
}
