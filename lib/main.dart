import 'package:appgain_task_movies/core/utils/router/deep_link_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appgain_task_movies/features/home/presentation/manager/fetch_popular_movies_cubit/fetch_popular_movies_cubit.dart';
import 'package:provider/provider.dart';
import 'core/utils/router/app_router.dart';
import 'core/constants/routes.dart';
import 'core/utils/services/firebase_notifications_services.dart';
import 'core/utils/services/navigation_service.dart';
import 'core/utils/services/service_locater.dart' as di;
import 'features/movie_details/presentation/manager/fetch_movie_cubit/fetch_movie_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupServiceLocater();
  await FirebaseNotificationsServices.setupFirebaseNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchPopularMoviesCubit(di.sl())..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (context) => FetchMovieCubit(di.sl()),
        ),
      ],
      child: Provider<DeepLinkBloc>(
        create: (context) => di.sl<DeepLinkBloc>(),
        dispose: (context, bloc) => di.sl<DeepLinkBloc>().dispose(),
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          title: 'Movies App',
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          initialRoute: kSplashScreen,
          onGenerateRoute: AppRouter.generateRoute,
          routes: AppRouter.initalRoutes(),
        ),
      ),
    );
  }
}

///For home screen
//adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "http://kerollos.com/homeScreen' com.kerollos.appgain_task_movies 

//For movieDetailsScreen/315162 to open the movie with id 315162 and show its details
//594767
//adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "http://kerollos.com/movieDetailsScreen/594767' com.kerollos.appgain_task_movies 

//When user try to open any other page not supported by the app
//like /movieDetailsScreen without id
//adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "http://kerollos.com/movieDetailsScreen' com.kerollos.appgain_task_movies 
