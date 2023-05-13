abstract class ApiConstance {
  static const String _kBaseUrl = "https://api.themoviedb.org/3/movie";

  static const String _kApiKey = "c1ae2892932e63a1e39779087bb21e85";

  static const String popularMoviesPath =
      '$_kBaseUrl/popular?api_key=$_kApiKey';

  static String movieDetailsPath(int movieId) =>
      '$_kBaseUrl/$movieId?api_key=$_kApiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
