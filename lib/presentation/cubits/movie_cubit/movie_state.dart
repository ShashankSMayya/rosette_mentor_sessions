part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}


class MovieLoading extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoaded extends MovieState {
  final MovieResults movieResults;

  const MovieLoaded(this.movieResults);

  @override
  List<Object> get props => [movieResults];
}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);

  @override
  List<Object> get props => [message];
}