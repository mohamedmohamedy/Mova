import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int pageNumber;
  final List<MovieData> moviesList;

  const Movies({
    required this.moviesList,
    required this.pageNumber,
  });

  @override
  List<Object?> get props => [
        pageNumber,
        moviesList,
      ];
}

class MovieData extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String releaseDate;
  final List<int> genreIds;
  final double voteAverage;
  final String posterPath;
  final double popularity;
  final String overview;

  const MovieData({
    required this.id,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.posterPath,
    required this.popularity,
    required this.genreIds,
    required this.overview,
    required this.title,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        voteAverage,
        releaseDate,
        popularity,
        posterPath,
        genreIds,
        overview,
        title,
      ];
}
