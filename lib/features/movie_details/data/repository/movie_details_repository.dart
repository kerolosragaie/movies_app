import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../models/movie_details_model/movie_details_model.dart';
import '../models/movie_details_paramters.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(
      MovieDetailsParameters parameters);
}
