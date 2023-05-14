import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  static void setupDeepLinkLogger(String? url) {
    if (kDebugMode) {
      if (url != null) {
        Fluttertoast.showToast(
          msg: "Launched URL: $url",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
      log("Launched URL: ${url ?? "not found."}");
    }
  }
}
