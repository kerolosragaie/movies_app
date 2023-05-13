import 'package:appgain_task_movies/core/constants/styles.dart';
import 'package:flutter/material.dart';
import '../../../data/models/movie_details_model/genre.dart';
import '../../../data/models/movie_details_model/movie_details_model.dart';

class BuildMovieDetailsBody extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;

  const BuildMovieDetailsBody({super.key, required this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              movieDetailsModel.title ?? "Title",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Release date: ${movieDetailsModel.releaseDate ?? 2022}',
                  style: const TextStyle(
                    color: Colors.orangeAccent,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      ((movieDetailsModel.voteAverage ?? 2) / 2)
                          .toStringAsFixed(1),
                      style: Styles.textStyle16
                          .copyWith(color: Colors.orangeAccent),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text('Genres: ${_showGenres(movieDetailsModel.genres!)}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle18.copyWith(color: Colors.white60)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              movieDetailsModel.overview ?? "Overview",
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: Styles.textStyle16.copyWith(
                color: Colors.white60,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }
    if (result.isEmpty) {
      return result;
    }
    return result.substring(0, result.length - 2);
  }
}
