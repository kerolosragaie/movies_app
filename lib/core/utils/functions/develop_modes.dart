import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../services/service_locater.dart';

class DevelopModes {
  //! Release Mode
  static void setupReleaseMode() {
    if (kReleaseMode) {
      sl.registerLazySingleton<Dio>(() => Dio());
    }
  }

  //! Debug Mode
  static void setupDebugMode() {
    if (kDebugMode) {
      Dio dio = Dio();
      dio.interceptors.add(
        LogInterceptor(
          request: false,
          requestHeader: true,
          requestBody: false,
          responseHeader: true,
          responseBody: false,
          error: true,
        ),
      );
      sl.registerLazySingleton<Dio>(() => dio);
    }
  }
}
