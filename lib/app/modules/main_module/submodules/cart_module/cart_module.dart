import 'package:flutter_modular/flutter_modular.dart';

import 'cart_bloc.dart';
import 'cart_page.dart';

class CartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const CartPage()),
  ];
}
