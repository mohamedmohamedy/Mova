import 'package:mova/modules/movies/common_utils/common_entities/movies.dart';

class MoviesModel extends Movies {
  final int page;
  final List<MovieData> results;
  final int totalPages;
  final int totalResults;

  const MoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  }) : super(
          moviesList: results,
          pageNumber: page,
        );

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        page: json['page'],
        results:
            List.from((json['results']).map((e) => MovieDataModel.fromJson(e))),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );
}

class MovieDataModel extends MovieData {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieDataModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverage: voteAverage,
        );

  factory MovieDataModel.fromJson(Map<String, dynamic> json) => MovieDataModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'] ?? '',
        genreIds: List.castFrom(json['genre_ids']),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'] ?? '',
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );
}
