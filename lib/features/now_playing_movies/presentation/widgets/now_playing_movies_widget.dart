import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mova/core/resources/values_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/network/api_constance.dart';
import '../../../../core/utils/loading_indicator_util.dart';
import '../../domain/entities/movie.dart';

class NowPlayingMoviesWidget extends StatefulWidget {
  final List<Movie> moviesList;
  const NowPlayingMoviesWidget({
    Key? key,
    required this.moviesList,
  }) : super(key: key);

  @override
  State<NowPlayingMoviesWidget> createState() => _NowPlayingMoviesWidgetState();
}

class _NowPlayingMoviesWidgetState extends State<NowPlayingMoviesWidget> {
  final _gridScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _animateMoviesListPosters();
  }

  // Here we use this method to make the movies' posters move automatically.
  void _animateMoviesListPosters() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (_gridScrollController.hasClients) 
        {_gridScrollController
            .animateTo(
              _gridScrollController.position.pixels ==
                      _gridScrollController.position.minScrollExtent
                  ? _gridScrollController.position.maxScrollExtent
                  : _gridScrollController.position.minScrollExtent,
              duration: const Duration(seconds: IntManager.i_30),
              curve: Curves.easeInOut,
            )
            .whenComplete(() => _animateMoviesListPosters());}
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _gridScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [
            // fromLTRB
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [
            DoubleManager.d_0,
            DoubleManager.d_03,
            DoubleManager.d_05,
            DoubleManager.d_1,
          ],
        ).createShader(
          Rect.fromLTRB(
            DoubleManager.d_0,
            DoubleManager.d_0,
            rect.width,
            rect.height,
          ),
        );
      },
      blendMode: BlendMode.dstIn,
      child: GridView.builder(
        shrinkWrap: true,
        controller: _gridScrollController,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: IntManager.i_3,
          crossAxisSpacing: DoubleManager.d_15.sp,
          mainAxisSpacing: DoubleManager.d_15.sp,
          childAspectRatio: DoubleManager.d_2,
        ),
        clipBehavior: Clip.antiAlias,
        itemCount: widget.moviesList.length,
        itemBuilder: (context, index) => Transform(
          transform: Matrix4.skewY(DoubleManager.d_02)
            ..rotateZ(DoubleManager.d_015),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DoubleManager.d_15.sp),
            child: CachedNetworkImage(
              fadeInCurve: Curves.easeIn,
              fadeInDuration: const Duration(milliseconds: IntManager.i_500),
              progressIndicatorBuilder: (context, url, progress) =>
                  const LoadingIndicatorUtil(),
              imageUrl: ApiConstance.imageUrl(widget.moviesList[index].poster),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
