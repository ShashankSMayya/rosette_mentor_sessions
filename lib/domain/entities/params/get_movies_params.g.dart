// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMoviesParams _$GetMoviesParamsFromJson(Map<String, dynamic> json) =>
    GetMoviesParams(
      query: json['query'] as String,
      includeAdult: json['includeAdult'] as bool? ?? false,
      language: json['language'] as String? ?? 'en-US',
      page: json['page'] as int? ?? 1,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$GetMoviesParamsToJson(GetMoviesParams instance) =>
    <String, dynamic>{
      'query': instance.query,
      'includeAdult': instance.includeAdult,
      'language': instance.language,
      'page': instance.page,
      'region': instance.region,
    };
