import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/constants/api_constance.dart';
import '../../../../core/utils/errors/failure.dart';
import '../../../../core/utils/errors/server_failure.dart';
import '../../../../core/utils/services/api_service.dart';
import '../models/movie_model.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  ApiService apiService;
  HomeRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
    try {
      final data = await apiService.get(url: ApiConstance.popularMoviesPath);
      List<MovieModel> moviesList = [];
      data["results"]
          .forEach((element) => moviesList.add(MovieModel.fromJson(element)));
      return Right(moviesList);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
