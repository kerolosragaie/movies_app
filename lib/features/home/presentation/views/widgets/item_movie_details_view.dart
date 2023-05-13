import 'package:flutter/material.dart';
import '../../data/models/movie_details_model/movie_details_model.dart';
import 'build_movie_details_body.dart';
import 'build_movie_details_header.dart';

class MovieDetailsViewItem extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;
  const MovieDetailsViewItem({super.key, required this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BuildMovieDetailsHeader(movieDetailsModel: movieDetailsModel),
          Positioned.fill(
            top: 300,
            child: BuildMovieDetailsBody(movieDetailsModel: movieDetailsModel),
          ),
        ],
      ),
    );
  }
}
