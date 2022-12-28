import 'package:mova/core/network/api_key.dart';

class ApiConstance {
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String nowPlayingMovies = '/movie/now_playing?$apiKey';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static String imageUrl(String path) => '$baseImageUrl$path';
  static const String apiKey = 'api_key=${ApiKey.moviesKey}';
}
