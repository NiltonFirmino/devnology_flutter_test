

import 'package:flutter_modular/flutter_modular.dart';


import 'item_details_bloc.dart';
import 'item_details_page.dart';
class ItemDetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ItemDetailsBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) =>  ItemDetailsPage( itemId: args.data,)),
    
  ];
}
