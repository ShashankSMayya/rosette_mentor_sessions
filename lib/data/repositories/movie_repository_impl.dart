import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_practice/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:test_practice/data/models/movie_results.dart';
import 'package:test_practice/domain/entities/app_error.dart';
import 'package:test_practice/domain/repositories/movie_repository.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;

  MovieRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppError, MovieResults>> getMovies(
      Map<String, dynamic> params) async {
    try {
      final movies = await _remoteDataSource.searchMovies(params);
      return Right(movies);
    } on Exception {
      return Future.value(
        Left(
          AppError(
            type: AppErrorType.api,
          ),
        ),
      );
    }
  }
}
