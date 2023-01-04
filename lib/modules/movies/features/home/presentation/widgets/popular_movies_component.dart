import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mova/core/resources/routes.dart';
import 'package:mova/core/utils/request_state.dart';
import 'package:mova/modules/movies/common_utils/common_entities/movies.dart';
import 'package:mova/modules/movies/features/home/presentation/bloc/home_bloc.dart';
import 'package:mova/modules/movies/features/home/presentation/widgets/shared_paging_component.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/resources/values_manager.dart';

class PopularMoviesComponent extends StatefulWidget {
  const PopularMoviesComponent({super.key});

  @override
  State<PopularMoviesComponent> createState() => _PopularMoviesComponentState();
}

class _PopularMoviesComponentState extends State<PopularMoviesComponent> {
  final _pagingController = PagingController<int, MovieData>(firstPageKey: 1);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<HomeBloc>(context)
          .add(GetPopularMoviesEvent(pageKey: pageKey));
    });
    _animateList();
  }

  void _animateList() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (_scrollController.hasClients) {
          _scrollController
              .animateTo(
                _scrollController.position.pixels ==
                        _scrollController.position.minScrollExtent
                    ? _scrollController.position.maxScrollExtent
                    : _scrollController.position.minScrollExtent,
                duration: const Duration(seconds: 999),
                curve: Curves.bounceIn,
              )
              .whenComplete(() => _animateList());
        }
      },
    );
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
          if (state.getPopularMoviesState == RequestState.success) {
            final isLastPage =
                state.getPopularMoviesData.moviesList.length < 20;

            if (isLastPage) {
              _pagingController
                  .appendLastPage(state.getPopularMoviesData.moviesList);
            } else {
              _pagingController.appendPage(
                  state.getPopularMoviesData.moviesList,
                  state.getPopularMoviesData.pageNumber + 1);
            }
          }

          if (state.getPopularMoviesState == RequestState.error) {
            Navigator.of(context).pushReplacementNamed(Routes.errorScreenKey,
                arguments: state.getPopularMoviesMessage);
            _pagingController.error = state.getPopularMoviesMessage;
          }
        },
        child: SharedPagingComponent(
          widgetScrollController: (value) => _scrollController = value,
          pagingController: _pagingController,
          height: 30.h,
          width: 100.w,
        ));
  }
}
