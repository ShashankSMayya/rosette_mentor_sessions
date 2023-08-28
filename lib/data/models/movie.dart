// {
//       "adult": false,
//       "backdrop_path": "/jBfHr0cZqHXbORe7g6tDKB16MhL.jpg",
//       "genre_ids": [
//         12,
//         35
//       ],
//       "id": 11483,
//       "original_language": "en",
//       "original_title": "Pirates",
//       "overview": "Captain Red runs a hardy pirate ship with the able assistance of Frog, a dashing young French sailor. One day Capt. Red is captured and taken aboard a Spanish galleon, but thanks to his inventiveness, he raises the crew to mutiny, takes over the ship, and kidnaps the niece of the governor of Maracaibo. The question is, can he keep this pace up?",
//       "popularity": 12.836,
//       "poster_path": "/kPHxXi5Dn89TLM7CsbZUC13OBtJ.jpg",
//       "release_date": "1986-05-08",
//       "title": "Pirates",
//       "video": false,
//       "vote_average": 6.196,
//       "vote_count": 225
//     },

import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  final bool adult;
  final String? backdropPath;
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
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
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
