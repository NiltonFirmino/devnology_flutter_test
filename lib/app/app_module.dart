import 'package:flutter_modular/flutter_modular.dart';

import 'core/utils/constants/app_routes.dart';
import 'modules/checkout_module/checkout_module.dart';
import 'modules/item_details_module/item_details_module.dart';
import 'modules/splash_module/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(kRouteSplash, module: SplashModule()),
    ModuleRoute(kRouteItemDetails, module: ItemDetailsModule()),
    ModuleRoute(kRouteCheckout, module: CheckoutModule()),
  ];

}