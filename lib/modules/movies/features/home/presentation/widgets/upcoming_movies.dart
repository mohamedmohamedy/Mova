import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mova/core/resources/routes.dart';
import 'package:mova/core/utils/request_state.dart';
import 'package:mova/modules/movies/common_utils/common_entities/movies.dart';
import 'package:mova/modules/movies/features/home/presentation/bloc/home_bloc.dart';
import 'package:mova/modules/movies/features/home/presentation/widgets/shared_paging_component.dart';
import 'package:sizer/sizer.dart';

class UpcomingMoviesComponent extends StatefulWidget {
  const UpcomingMoviesComponent({super.key});

  @override
  State<UpcomingMoviesComponent> createState() =>
      _UpcomingMoviesComponentState();
}

class _UpcomingMoviesComponentState extends State<UpcomingMoviesComponent> {
  final _pagingController = PagingController<int, MovieData>(firstPageKey: 1);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<HomeBloc>(context)
          .add(GetUpcomingMoviesEvent(pageKey: pageKey));
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
          if (state.getUpcomingMoviesState == RequestState.success) {
            final isLastPage =
                state.getUpcomingMoviesData.moviesList.length < 20;

            if (isLastPage) {
              _pagingController
                  .appendLastPage(state.getUpcomingMoviesData.moviesList);
            } else {
              _pagingController.appendPage(
                  state.getUpcomingMoviesData.moviesList,
                  state.getUpcomingMoviesData.pageNumber + 1);
            }
          }

          if (state.getUpcomingMoviesState == RequestState.error) {
            Navigator.of(context).pushReplacementNamed(Routes.errorScreenKey,
                arguments: state.getUpcomingMoviesMessage);
            _pagingController.error = state.getUpcomingMoviesMessage;
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
