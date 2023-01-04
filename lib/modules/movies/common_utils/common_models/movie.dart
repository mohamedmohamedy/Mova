
import '../common_entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.poster,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.id,
    required super.vote,
    required super.genreId,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        poster: json['poster_path'],
        title: json['title'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        id: json['id'],
        vote: json['vote_average'].toDouble(),
        genreId: List<int>.from(json['genre_ids'].map((e) => e)),
      );
}
