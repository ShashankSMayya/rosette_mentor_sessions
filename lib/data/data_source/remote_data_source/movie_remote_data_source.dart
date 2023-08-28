import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_practice/core/api/api_constants.dart';
import 'package:test_practice/data/models/movie_results.dart';
import 'package:test_practice/domain/entities/app_error.dart';

import '../../../core/api/api_client.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResults> searchMovies(Map<String, dynamic> params);
}

@LazySingleton(as: MovieRemoteDataSource)
class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<MovieResults> searchMovies(Map<String, dynamic> params) async {
    final res = await _client.get(ApiConstants.searchMovieEndpoint,
        queryParams: params);
    return MovieResults.fromJson(res);
  }
}
