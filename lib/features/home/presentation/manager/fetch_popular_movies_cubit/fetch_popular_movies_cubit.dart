import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/movie_model.dart';
import '../../data/repositories/home_repository.dart';

part 'fetch_popular_movies_state.dart';

class FetchPopularMoviesCubit extends Cubit<FetchPopularMoviesState> {
  final HomeRepository homeRepository;
  FetchPopularMoviesCubit(this.homeRepository)
      : super(FetchPopularMoviesInitial());

  Future<void> fetchPopularMovies() async {
    emit(FetchPopularMoviesLoading());
    var result = await homeRepository.fetchPopularMovies();
    result.fold((failure) {
      emit(FetchPopularMoviesFailure(errorMessage: failure.errorMessage));
    }, (moviesList) {
      emit(FetchPopularMoviesLoaded(moviesList));
    });
  }
}
