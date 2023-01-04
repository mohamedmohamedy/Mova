import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mova/core/resources/routes.dart';
import 'package:mova/core/utils/request_state.dart';
import 'package:mova/modules/movies/common_utils/common_entities/movies.dart';
import 'package:mova/modules/movies/features/home/presentation/bloc/home_bloc.dart';
import 'package:mova/modules/movies/features/home/presentation/widgets/shared_paging_component.dart';
import 'package:sizer/sizer.dart';

class WeekTrendingMoviesComponent extends StatefulWidget {
  const WeekTrendingMoviesComponent({super.key});

  @override
  State<WeekTrendingMoviesComponent> createState() =>
      _WeekTrendingMoviesComponentState();
}

class _WeekTrendingMoviesComponentState
    extends State<WeekTrendingMoviesComponent> {
  final _pagingController = PagingController<int, MovieData>(firstPageKey: 1);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<HomeBloc>(context)
          .add(GetWeekTrendingMoviesEvent(pageKey: pageKey));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.getWeekTrendingMoviesState == RequestState.success) {
            final isLastPage =
                state.getWeekTrendingMoviesData.moviesList.length < 20;

            if (isLastPage) {
              _pagingController
                  .appendLastPage(state.getWeekTrendingMoviesData.moviesList);
            } else {
              _pagingController.appendPage(
                  state.getWeekTrendingMoviesData.moviesList,
                  state.getWeekTrendingMoviesData.pageNumber + 1);
            }
          }

          if (state.getWeekTrendingMoviesState == RequestState.error) {
            Navigator.of(context).pushReplacementNamed(Routes.errorScreenKey,
                arguments: state.getWeekTrendingMoviesMessage);
            _pagingController.error = state.getWeekTrendingMoviesMessage;
          }
        },
        child: SharedPagingComponent(
          widgetScrollController: (value) => _scrollController = value,
          pagingController: _pagingController,
          height: 30.h,
          width: 30.w,
        ));
  }
}
