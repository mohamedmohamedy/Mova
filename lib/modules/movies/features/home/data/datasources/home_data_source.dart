import 'package:dio/dio.dart';
import 'package:mova/core/network/api_constance.dart';
import 'package:mova/core/network/dio_helper.dart';
import 'package:mova/modules/movies/common_utils/common_entities/movies.dart';
import 'package:mova/modules/movies/common_utils/common_models/movies_model.dart';

abstract class BaseHomeDataSource {
  Future<Movies> getUpcomingMovies(int pageKey);
  Future<Movies> getWeekTrendingMovies(int pageKey);
  Future<Movies> getPopularMovies(int pageKey);
}

class HomeDataSourceByDio implements BaseHomeDataSource {
  final BaseDioHelper _dio;
  const HomeDataSourceByDio(this._dio);

  @override
  Future<Movies> getWeekTrendingMovies(int pageKey) async {
    return await _generalMethod(
        ApiConstance.weekTrendingMoviesEndPoint(pageKey));
  }

  @override
  Future<Movies> getUpcomingMovies(int pageKey) async {
    return await _generalMethod(ApiConstance.upComingMoviesEndPoint(pageKey));
  }

  @override
  Future<Movies> getPopularMovies(int pageKey) async {
    return await _generalMethod(ApiConstance.popularMoviesEndPoint(pageKey));
  }

  Future<Movies> _generalMethod(String endPoint) async {
    final response = await _dio.get(endPoint: endPoint) as Response;
    final movies = MoviesModel.fromJson(response.data);
    return movies;
  }
}
