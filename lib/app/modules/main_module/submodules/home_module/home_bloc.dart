import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class HomeBloc extends Disposable {

 final StreamController<bool> _homeController = StreamController();
  Stream<bool> get homeStream => _homeController.stream;
  Sink<bool> get homeSink => _homeController.sink;

  @override
  void dispose() {
  }
}
