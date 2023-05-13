import 'package:appgain_task_movies/features/home/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/utils/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
}
