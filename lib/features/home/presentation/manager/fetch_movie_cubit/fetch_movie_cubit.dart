import 'package:appgain_task_movies/features/home/presentation/data/models/movie_details_paramters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/movie_details_model/movie_details_model.dart';
import '../../data/repositories/home_repository.dart';

part 'fetch_movie_state.dart';

class FetchMovieCubit extends Cubit<FetchMovieState> {
  final HomeRepository homeRepository;

  FetchMovieCubit(this.homeRepository) : super(FetchMovieInitial());
  Future<void> fetchMovieDetails(int id) async {
    final result = await homeRepository
        .fetchMovieDetails(MovieDetailsParameters(movieId: id));
    result.fold((failure) {
      emit(FetchMovieFailure(errorMessage: failure.errorMessage));
    }, (movie) {
      emit(FetchMovieLoaded(movie));
    });
  }
}
