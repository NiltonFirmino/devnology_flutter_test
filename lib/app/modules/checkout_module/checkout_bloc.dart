import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class CheckoutBloc implements Disposable {
  final StreamController<bool> _checkoutController = StreamController();
  Stream<bool> get checkoutStream => _checkoutController.stream;
  Sink<bool> get checkoutSink => _checkoutController.sink;

  
  @override
  void dispose() {}
}
