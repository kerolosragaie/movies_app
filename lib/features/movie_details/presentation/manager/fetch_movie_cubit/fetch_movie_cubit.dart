import 'package:appgain_task_movies/features/movie_details/data/repository/movie_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/movie_details_model/movie_details_model.dart';
import '../../../data/models/movie_details_paramters.dart';

part 'fetch_movie_state.dart';

class FetchMovieCubit extends Cubit<FetchMovieState> {
  final MovieDetailsRepository movieDetailsRepository;

  FetchMovieCubit(this.movieDetailsRepository) : super(FetchMovieInitial());
  Future<void> fetchMovieDetails(int id) async {
    final result = await movieDetailsRepository
        .fetchMovieDetails(MovieDetailsParameters(movieId: id));
    result.fold((failure) {
      emit(FetchMovieFailure(errorMessage: failure.errorMessage));
    }, (movie) {
      emit(FetchMovieLoaded(movie));
    });
  }
}
