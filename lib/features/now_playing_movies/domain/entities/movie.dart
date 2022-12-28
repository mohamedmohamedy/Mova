import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String poster, title, overview, releaseDate;
  final int id;
  final double vote;
  final List<int> genreId;

  const Movie({
    required this.poster,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.id,
    required this.vote,
    required this.genreId,
  });

  @override
  List<Object?> get props => [
        poster,
        title,
        overview,
        releaseDate,
        id,
        vote,
        genreId,
      ];
}
