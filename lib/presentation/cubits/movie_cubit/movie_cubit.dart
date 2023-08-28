import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_practice/domain/entities/params/get_movies_params.dart';

import '../../../data/models/movie_results.dart';
import '../../../domain/repositories/movie_repository.dart';

part 'movie_state.dart';

@injectable
class MovieCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;

  MovieCubit(this._movieRepository) : super(MovieInitial());

  void getMovies({required GetMoviesParams params}) async {
    emit(MovieLoading());
    final res = await _movieRepository.getMovies(params.toJson());
    emit(res.fold(
      (l) => MovieError(l.errorMessage),
      (r) => MovieLoaded(r),
    ));
  }
}
