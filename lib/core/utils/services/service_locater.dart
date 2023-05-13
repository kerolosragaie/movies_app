import 'package:appgain_task_movies/core/utils/services/api_service.dart';
import 'package:appgain_task_movies/features/home/presentation/data/repositories/home_repository.dart';
import 'package:get_it/get_it.dart';
import '../../../features/home/presentation/data/repositories/home_repository_impl.dart';
import '../functions/develop_modes.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocater() async {
  //! Repositories
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(apiService: sl()));

  //! Core
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  // !External (for packages)
  DevelopModes.setupDebugMode();
  DevelopModes.setupReleaseMode();
}
