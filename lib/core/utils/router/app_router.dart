import 'package:appgain_task_movies/core/constants/routes.dart';
import 'package:appgain_task_movies/features/unkown_screen/presentation/views/unkown_screen_view.dart';
import 'package:flutter/material.dart';
import '../../../features/home/presentation/views/home_view.dart';
import '../../../features/movie_details/presentation/views/movie_details_view.dart';
import '../../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> initalRoutes() {
    return {
      kSplashScreen: (context) => const SplashView(),
      kHomeScreen: (context) => const HomeView(),
      kMovieDetailsScreen: (context) => const MovieDetailsView(
            launchedFromDL: false,
          ),
    };
  }

  static Route? generateRoute(RouteSettings routeSettings) {
    /// Handle kSplashScreen & kMovieDetailsScreen
    if (routeSettings.name == kSplashScreen) {
      return MaterialPageRoute(builder: (context) => const SplashView());
    } else if (routeSettings.name == kMovieDetailsScreen) {
      return MaterialPageRoute(
          builder: (context) => const ScreenNotFoundView());
    }

    /// Handle '/movieDetailsScreen/:movieId'
    var uri = Uri.parse(routeSettings.name!);
    if (uri.pathSegments.length == 2 &&
        uri.pathSegments.first == 'movieDetailsScreen') {
      String id = uri.pathSegments[1];
      return MaterialPageRoute(
          builder: (context) => MovieDetailsView(
                movieId: id,
                launchedFromDL: false,
              ));
    }

    return MaterialPageRoute(builder: (context) => const ScreenNotFoundView());
  }
}
