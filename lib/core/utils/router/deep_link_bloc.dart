import 'dart:async';
import 'package:flutter/services.dart';

abstract class Bloc {
  void dispose();
}

class DeepLinkBloc extends Bloc {
  //Event Channel
  static const stream = EventChannel('http.kerollos.com/events');

  //Method channel
  static const platform = MethodChannel('http.kerollos.com/channel');

  final StreamController<String> _stateController = StreamController();

  Stream<String> get state => _stateController.stream;

  Sink<String> get stateSink => _stateController.sink;

  //Adding the listener into constructor
  DeepLinkBloc() {
    //Checking application start by deep link
    startUri().then(onRedirected);
    //Checking broadcast stream, if deep link was clicked in opened application
    stream.receiveBroadcastStream().listen((d) => onRedirected(d));
  }

  void onRedirected(String? uri) {
    //------> Here can be any uri analysis, checking tokens etc, if it’s necessary
    // Throw deep link URI into the BloC's stream
    if (uri != null) {
      stateSink.add(uri);
    }
  }

  Future<String?> startUri() async {
    try {
      return platform.invokeMethod('initialLink');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  @override
  void dispose() {
    _stateController.close();
  }
}
