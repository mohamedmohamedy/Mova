import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mova/modules/movies/features/home/presentation/widgets/shader_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/network/api_constance.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../../../../../core/utils/loading_indicator_util.dart';
import '../../../../common_utils/common_entities/movies.dart';

class SharedPagingComponent extends StatelessWidget {
  const SharedPagingComponent({
    Key? key,
    required this.pagingController,
    required this.height,
    required this.width,
    required this.widgetScrollController,
  }) : super(key: key);

  final PagingController<int, MovieData> pagingController;
  final Function widgetScrollController;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    widgetScrollController(scrollController);

    return PagedListView<int, MovieData>(
      pagingController: pagingController,
      scrollController: scrollController,
      scrollDirection: Axis.horizontal,
      builderDelegate: PagedChildBuilderDelegate<MovieData>(
        itemBuilder: (context, item, index) => ShaderWidget(
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 2.sp),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(DoubleManager.d_15.sp),
              child: CachedNetworkImage(
                fadeInCurve: Curves.easeIn,
                fadeInDuration: const Duration(milliseconds: IntManager.i_500),
                progressIndicatorBuilder: (context, url, progress) =>
                    const LoadingIndicatorUtil(),
                imageUrl: ApiConstance.imageUrl(item.posterPath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        animateTransitions: true,
        transitionDuration: const Duration(milliseconds: IntManager.i_300),
        newPageErrorIndicatorBuilder: (context) =>
            const Text('Something wrong'),
      ),
    );
  }
}
