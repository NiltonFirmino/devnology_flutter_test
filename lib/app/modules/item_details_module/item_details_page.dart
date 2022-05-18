import 'dart:developer' as dev;

import 'package:devnology_flutter_test/app/core/components/appbar_widget.dart';
import 'package:devnology_flutter_test/app/core/components/button_widget.dart';
import 'package:devnology_flutter_test/app/modules/item_details_module/components/carousel_item_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/data/mock_product_data_source.dart';
import '../../core/utils/constants/app_routes.dart';
import '../../core/utils/constants/app_strings.dart';
import '../../core/utils/style/colors/general_colors.dart';
import '../../core/utils/style/themes/text_styles.dart';
import 'item_details_bloc.dart';

class ItemDetailsPage extends StatefulWidget {
  final dynamic itemId;
  const ItemDetailsPage({
    Key? key,
    required this.itemId,
  }) : super(key: key);

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  final controller = Modular.get<ItemDetailsBloc>();

  @override
  void initState() {
    super.initState();
    dev.log(Modular.to.path, name: kPath);
    controller.setCarouselItemDetailsResult(widget.itemId['id']);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kColorBackgroundWhite,
      appBar: myAppBar(
        isActiveCart: true,
        numberItemsInCart: mockItemInCart,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.itemId['itemTitle'],
                style: TextStyles.headline3(),
              ),
              CarouselItemDetailsWidget(
                carouselItemDetails: controller.carouselItemDetails,
              ),
              Text(
                kPrice,
                style: TextStyles.headline3(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  widget.itemId['price'],
                  style: TextStyles.headline2(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  kAboutThisItem,
                  style: TextStyles.headline3(),
                ),
              ),
              Text(
                mockAboutThis,
                style: TextStyles.bodyText2(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        width: size,
        height: 86,
        color: kColorBackgroundGradientSecondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyButtonWidget(
                titleButton: kShareThis,
                onPressed: () {},
                isSharedButton: true,
              ),
              MyButtonWidget(
                titleButton: kAddToCart,
                onPressed: () {
                  Modular.to.pushNamed(
                    kRouteMain,
                    arguments: 2,
                  );
                },
                isSharedButton: false,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
