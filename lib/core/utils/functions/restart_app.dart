import 'dart:async';
import 'package:flutter/services.dart';

class RestartApp {
  static const MethodChannel _channel = MethodChannel('restart');

  /// Fill [webOrigin] only when your current origin is different than the app's origin.
  static Future<bool> restart({String? webOrigin}) async =>
      (await _channel.invokeMethod('restartApp', webOrigin)) == "ok";
}
