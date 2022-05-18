

import 'package:flutter_modular/flutter_modular.dart';


import 'checkout_bloc.dart';
import 'checkout_page.dart';
class CheckoutModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CheckoutBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const CheckoutPage()),
   
  ];
}
