import 'package:flutter_modular/flutter_modular.dart';

import '../../core/utils/constants/app_routes.dart';

import 'main_bloc.dart';
import 'main_page.dart';
import 'submodules/cart_module/cart_module.dart';
import 'submodules/home_module/home_module.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MainBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => MainPage(
        pageId: args.data,
      ),
      children: [
        ModuleRoute(kRouteHome, module: HomeModule()),
        ModuleRoute(kRouteCart, module: CartModule()),
      ],
    ),
  ];
}
