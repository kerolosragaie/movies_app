import 'package:appgain_task_movies/core/utils/router/deep_link_bloc.dart';
import 'package:appgain_task_movies/features/home/presentation/views/home_view_build.dart';
import 'package:appgain_task_movies/features/unkown_screen/presentation/views/unkown_screen_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/functions/develop_modes.dart';
import '../../../movie_details/presentation/views/movie_details_view.dart';
import '/core/utils/services/service_locater.dart' as di;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: di.sl<DeepLinkBloc>().state,
      builder: (context, snapshot) {
        DevelopModes.setupDeepLinkLogger(snapshot.data);
        if (!snapshot.hasData) {
          return const HomeViewBuild();
        } else {
          return _setupDeepLinkRoutes(snapshot);
        }
      },
    );
  }

  Widget _setupDeepLinkRoutes(AsyncSnapshot<String> snapshot) {
    var uri = Uri.parse(snapshot.data!);
    if (uri.pathSegments.length == 2 &&
        uri.pathSegments.first == 'movieDetailsScreen') {
      String id = uri.pathSegments[1];
      return MovieDetailsView(
        movieId: id,
        launchedFromDL: true,
      );
      //TODO take here
    } else if (uri.pathSegments.first == 'homeScreen') {
      return const HomeViewBuild();
    }
    return const ScreenNotFoundView();
  }
}
