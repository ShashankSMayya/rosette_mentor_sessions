import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';

part 'movie_results.g.dart';

@JsonSerializable()
class MovieResults{
  final int page;
  final List<Movie> results;

  MovieResults({
    required this.page,
    required this.results,
  });

  factory MovieResults.fromJson(Map<String, dynamic> json) => _$MovieResultsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResultsToJson(this);
}