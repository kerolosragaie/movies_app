part of 'fetch_popular_movies_cubit.dart';

abstract class FetchPopularMoviesState {}

class FetchPopularMoviesInitial extends FetchPopularMoviesState {}

class FetchPopularMoviesLoading extends FetchPopularMoviesState {}

class FetchPopularMoviesLoaded extends FetchPopularMoviesState {
  final List<MovieModel> moviesList;

  FetchPopularMoviesLoaded(this.moviesList);
}

class FetchPopularMoviesFailure extends FetchPopularMoviesState {
  final String errorMessage;
  FetchPopularMoviesFailure({
    required this.errorMessage,
  });
}
