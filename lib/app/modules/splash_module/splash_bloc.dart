import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class SplashBloc implements Disposable {
  final StreamController<bool> _splashController = StreamController();
  Stream<bool> get splashStream => _splashController.stream;
  Sink<bool> get splashSink => _splashController.sink;

  double animatedSize = 0.4;

  @override
  void dispose() {}
}
