import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class MainBloc implements Disposable {
  final StreamController<bool> _mainController = StreamController();
  Stream<bool> get mainStream => _mainController.stream;
  Sink<bool> get mainSink => _mainController.sink;

 
  @override
  void dispose() {}
}
