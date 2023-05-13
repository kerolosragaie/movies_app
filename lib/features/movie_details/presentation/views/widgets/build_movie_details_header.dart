import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/api_constance.dart';
import '../../../data/models/movie_details_model/movie_details_model.dart';

class BuildMovieDetailsHeader extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;

  const BuildMovieDetailsHeader({
    super.key,
    required this.movieDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Stack(
          children: [
            Container(
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color(0xff0e0f11),
                  ],
                  begin: Alignment(0, 0.3),
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Hero(
                tag: movieDetailsModel.id ?? "tag",
                child: CachedNetworkImage(
                  imageUrl:
                      ApiConstance.imageUrl(movieDetailsModel.posterPath!),
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
