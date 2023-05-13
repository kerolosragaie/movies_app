part of 'fetch_movie_cubit.dart';

abstract class FetchMovieState {}

class FetchMovieInitial extends FetchMovieState {}

class FetchMovieLoading extends FetchMovieState {}

class FetchMovieLoaded extends FetchMovieState {
  final MovieDetailsModel moveDetailsModel;

  FetchMovieLoaded(this.moveDetailsModel);
}

class FetchMovieFailure extends FetchMovieState {
  final String errorMessage;

  FetchMovieFailure({required this.errorMessage});
}
