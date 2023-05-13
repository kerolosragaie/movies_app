class MovieModel {
  final int? id;
  final String? title;
  final String? backdropPath;
  final List<int>? genreIds;
  final String? overview;
  final double? voteAverage;
  final String? releaseDate;

  const MovieModel({
    this.id,
    this.title,
    this.backdropPath,
    this.genreIds,
    this.overview,
    this.voteAverage,
    this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
      );
}
