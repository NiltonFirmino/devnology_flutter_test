import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class CartBloc implements Disposable {
  final StreamController<bool> _cartController = StreamController();
  Stream<bool> get cartStream => _cartController.stream;
  Sink<bool> get cartSink => _cartController.sink;

  
  @override
  void dispose() {}
}
