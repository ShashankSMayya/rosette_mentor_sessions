part of 'movie_filter_cubit.dart';

class MovieFilterState extends Equatable {
  final GetMoviesParams params;

  const MovieFilterState(this.params);

  @override
  List<Object?> get props => [params];


  //copyWith
  MovieFilterState copyWith({
    GetMoviesParams? params,
  }) {
    return MovieFilterState(
      params ?? this.params,
    );
  }
}
