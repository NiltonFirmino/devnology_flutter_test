import 'dart:developer' as dev;

import 'package:devnology_flutter_test/app/core/components/button_widget.dart';
import 'package:devnology_flutter_test/app/modules/main_module/submodules/cart_module/components/card_item_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/data/mock_product_data_source.dart';
import '../../../../core/utils/constants/app_routes.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/style/colors/general_colors.dart';
import '../../../../core/utils/style/themes/text_styles.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    dev.log(Modular.to.path + kRouteCart, name: kPath);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kColorBackgroundWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kCartTitle,
                  style: TextStyles.headline1(),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: mockProductsValues.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CardItemCartWidget(
                      itemTitle: mockProductsValues[index]['itemTitle']!,
                      itemPrice: mockProductsValues[index]['price']!,
                      itemImage: mockProductsValues[index]['image'][0]!,
                      itemTypeInTheCart: mockProductsValues[index]
                          ['itemInCart']!,
                    );
                  },
                ),
              ],
            ),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kTotal,
                      style: TextStyles.bodyText2(
                        color: kColorSecondaryLight,
                      ),
                    ),
                    Text(
                      kPriceValue,
                      style: TextStyles.subtitle2(
                        color: kColorSecondaryLight,
                      ),
                    ),
                  ],
                ),
                MyButtonWidget(
                  titleButton: kCheckout,
                  onPressed: () {
                    Modular.to.pushNamed(kRouteCheckout);
                  },
                  isSharedButton: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
