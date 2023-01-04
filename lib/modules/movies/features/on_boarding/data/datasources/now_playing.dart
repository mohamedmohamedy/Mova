import 'package:dio/dio.dart';
import '../../../../../../core/network/api_constance.dart';
import '../../../../../../core/network/dio_helper.dart';
import '../../../../common_utils/common_models/movie.dart';

abstract class BaseNowPlayingMoviesDataSource {
  Future<List<MovieModel>> getNowPlying();
}

class NowPlayingMoviesDataSource implements BaseNowPlayingMoviesDataSource {
  final BaseDioHelper _dioHelper;

  const NowPlayingMoviesDataSource(this._dioHelper);

  @override
  Future<List<MovieModel>> getNowPlying() async {
    final response = await _dioHelper.get(
        endPoint: ApiConstance.nowPlayingMovies) as Response;

    final data = List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    return data;
  }
}
