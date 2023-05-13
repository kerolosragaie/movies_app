import 'package:appgain_task_movies/features/home/presentation/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/utils/errors/failure.dart';
import '../models/movie_details_model/movie_details_model.dart';
import '../models/movie_details_paramters.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(
      MovieDetailsParameters parameters);
}
