import 'package:dartz/dartz.dart';
import 'package:appgain_task_movies/core/utils/errors/failure.dart';
import 'package:appgain_task_movies/features/movie_details/data/models/movie_details_model/movie_details_model.dart';
import 'package:appgain_task_movies/features/movie_details/data/models/movie_details_paramters.dart';
import 'package:appgain_task_movies/features/movie_details/data/repository/movie_details_repository.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/api_constance.dart';
import '../../../../core/utils/errors/server_failure.dart';
import '../../../../core/utils/services/api_service.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  ApiService apiService;
  MovieDetailsRepositoryImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(
      MovieDetailsParameters parameters) async {
    try {
      final data = await apiService.get(
        url: ApiConstance.movieDetailsPath(parameters.movieId),
      );
      return Right(MovieDetailsModel.fromJson(data));
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
