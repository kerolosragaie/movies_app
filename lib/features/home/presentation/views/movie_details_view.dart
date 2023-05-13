import 'package:appgain_task_movies/features/home/presentation/views/widgets/item_movie_details_view.dart';
import 'package:appgain_task_movies/features/unkown_screen_view/presentation/views/unkown_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/widget_custom_error.dart';
import '../../../../core/utils/widgets/widget_loading_indicator.dart';
import '../manager/fetch_movie_cubit/fetch_movie_cubit.dart';

class MovieDetailsView extends StatefulWidget {
  final String? movieId;
  const MovieDetailsView({
    super.key,
    this.movieId,
  });

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();
    onInitScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FetchMovieCubit, FetchMovieState>(
        builder: (context, state) {
          if (state is FetchMovieLoading) {
            return const LoadingIndicatorWidget();
          } else if (state is FetchMovieFailure) {
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
            );
          } else if (state is FetchMovieLoaded) {
            return MovieDetailsViewItem(
              movieDetailsModel: state.moveDetailsModel,
            );
          }
          return const LoadingIndicatorWidget();
        },
      ),
    );
  }

  void onInitScreen() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      try {
        BlocProvider.of<FetchMovieCubit>(context)
            .fetchMovieDetails(int.parse(widget.movieId!));
      } catch (e) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ScreenNotFoundView()));
      }
    });
  }
}
