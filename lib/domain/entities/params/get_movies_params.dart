import 'package:json_annotation/json_annotation.dart';

part 'get_movies_params.g.dart';

@JsonSerializable()
class GetMoviesParams {
  final String query;
  final bool includeAdult;
  final String language;
  final int page;
  final String? region;

  GetMoviesParams({
    required this.query,
    this.includeAdult = false,
    this.language = 'en-US',
    this.page = 1,
    this.region,
  });


  //copyWith method
  GetMoviesParams copyWith({
    String? query,
    bool? includeAdult,
    String? language,
    int? page,
    String? region,
  }) {
    return GetMoviesParams(
      query: query ?? this.query,
      includeAdult: includeAdult ?? this.includeAdult,
      language: language ?? this.language,
      page: page ?? this.page,
      region: region ?? this.region,
    );
  }

  factory GetMoviesParams.fromJson(Map<String, dynamic> json) =>
      _$GetMoviesParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetMoviesParamsToJson(this);
}
