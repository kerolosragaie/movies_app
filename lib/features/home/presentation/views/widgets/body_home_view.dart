import 'package:flutter/material.dart';

import 'list_view_popular_movies.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: PopularMoviesListView(),
        ),
      ],
    );
  }
}
