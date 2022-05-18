import 'package:flutter_modular/flutter_modular.dart';

import '../../core/utils/constants/app_routes.dart';

import '../main_module/main_module.dart';
import 'splash_bloc.dart';
import 'splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const SplashPage()),
    ModuleRoute(kRouteMain, module: MainModule()),
  ];
}
