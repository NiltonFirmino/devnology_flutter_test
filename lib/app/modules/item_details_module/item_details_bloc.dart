import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../../core/data/mock_product_data_source.dart';
class ItemDetailsBloc implements Disposable {
  late StreamController<List> carouselItemDetailsController;

  ItemDetailsBloc() {
    carouselItemDetailsController = StreamController.broadcast();
  }
  List carouselItemDetails = [];

  setCarouselItemDetailsResult(String itemId) {
    switch (itemId) {
      case 'mockItem01':
        carouselItemDetails = mockProductsValues[0]['image'];
        carouselItemDetailsController.sink.add(carouselItemDetails);
        break;
      case 'mockItem02':
        carouselItemDetails = mockProductsValues[1]['image'];
        carouselItemDetailsController.sink.add(carouselItemDetails);
        break;
      case 'mockItem03':
        carouselItemDetails = mockProductsValues[2]['image'];
        carouselItemDetailsController.sink.add(carouselItemDetails);
        break;
    }
  }

  @override
  void dispose() {
    carouselItemDetailsController.close();
  }
}
