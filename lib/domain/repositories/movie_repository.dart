import 'package:dartz/dartz.dart';
import 'package:test_practice/data/models/movie_results.dart';
import 'package:test_practice/domain/entities/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError, MovieResults>> getMovies(Map<String, dynamic> params);
}
