// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResults _$MovieResultsFromJson(Map<String, dynamic> json) => MovieResults(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieResultsToJson(MovieResults instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
