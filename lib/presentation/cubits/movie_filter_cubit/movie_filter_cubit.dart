import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_practice/domain/entities/params/get_movies_params.dart';

part 'movie_filter_state.dart';

@injectable
class MovieFilterCubit extends Cubit<MovieFilterState> {
  MovieFilterCubit() : super(MovieFilterState(GetMoviesParams(query: '')));

  void searchMovies(String query) {
    emit(state.copyWith(params: state.params.copyWith(query: query)));
  }
}
