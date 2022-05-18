import 'dart:developer' as dev;

import 'package:devnology_flutter_test/app/core/utils/style/themes/text_styles.dart';
import 'package:devnology_flutter_test/app/modules/main_module/submodules/home_module/components/card_icons_widget.dart';
import 'package:devnology_flutter_test/app/modules/main_module/submodules/home_module/components/card_item_widget.dart';
import 'package:devnology_flutter_test/app/modules/main_module/submodules/home_module/components/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/data/mock_product_data_source.dart';
import '../../../../core/utils/constants/app_routes.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/style/colors/general_colors.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = kAppName}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    dev.log(Modular.to.path + kRouteHome, name: kPath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 15.0, top: 25.0),
          child: Text(
            kCategories,
            style: TextStyles.headline1(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CardIconWidget(
              icon: 'apparel_icon',
              text: kApparel,
            ),
            CardIconWidget(
              icon: 'beauty_icon',
              text: kBeauty,
            ),
            CardIconWidget(
              icon: 'shoes_icon',
              text: kShoes,
            ),
            CardIconWidget(
              icon: 'see_all_icon',
              text: kSeeAll,
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 15.0, top: 25.0),
          child: Text(
            kLastest,
            style: TextStyles.headline1(),
          ),
        ),
        const CarouselHomeWidget(
          cardImage01: 'banner01',
          cardImage02: 'banner02',
          cardImage03: 'banner03',
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: kColorSecondaryLight,
                child: InkWell(
                  child: CardItemWidget(
                    imageItem: mockProductsValues[0]['image'][0]!,
                    titleItem: mockProductsValues[0]['item']!,
                    priceItem: mockProductsValues[0]['price']!,
                  ),
                  onTap: () async {
                    Modular.to.pushNamed(
                      kRouteItemDetails,
                      arguments: mockProductsValues[0],
                    );
                  },
                ),
              ),
              Material(
                color: kColorSecondaryLight,
                child: InkWell(
                  child: CardItemWidget(
                    imageItem: mockProductsValues[1]['image'][0]!,
                    titleItem: mockProductsValues[1]['item']!,
                    priceItem: mockProductsValues[1]['price']!,
                  ),
                  onTap: () async {
                    Modular.to.pushNamed(
                      kRouteItemDetails,
                      arguments: mockProductsValues[1],
                    );
                  },
                ),
              ),
              Material(
                color: kColorSecondaryLight,
                child: InkWell(
                  child: CardItemWidget(
                    imageItem: mockProductsValues[2]['image'][0]!,
                    titleItem: mockProductsValues[2]['item']!,
                    priceItem: mockProductsValues[2]['price']!,
                  ),
                  onTap: () async {
                    Modular.to.pushNamed(
                      kRouteItemDetails,
                      arguments: mockProductsValues[2],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
