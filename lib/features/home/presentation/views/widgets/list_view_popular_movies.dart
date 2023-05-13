import 'package:appgain_task_movies/core/utils/widgets/widget_loading_indicator.dart';
import 'package:appgain_task_movies/features/home/presentation/manager/fetch_popular_movies_cubit/fetch_popular_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/widget_custom_error.dart';
import '../../data/models/movie_model.dart';
import 'item_movie.dart';

class PopularMoviesListView extends StatelessWidget {
  final bool isSliverList;
  const PopularMoviesListView({super.key, this.isSliverList = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPopularMoviesCubit, FetchPopularMoviesState>(
      builder: (context, state) {
        if (state is FetchPopularMoviesLoading) {
          return const LoadingIndicatorWidget();
        } else if (state is FetchPopularMoviesFailure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else if (state is FetchPopularMoviesLoaded) {
          return isSliverList
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.moviesList.length,
                    (context, index) {
                      return _itemWidget(state.moviesList[index]);
                    },
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.moviesList.length,
                  itemBuilder: (context, index) {
                    return _itemWidget(state.moviesList[index]);
                  },
                );
        }
        return const LoadingIndicatorWidget();
      },
    );
  }

  Widget _itemWidget(MovieModel movieModel) => MovieItem(
        movieModel: movieModel,
      );
}
