import 'dart:developer' as dev;

import 'package:devnology_flutter_test/app/core/components/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

import '../../core/components/appbar_widget.dart';
import '../../core/utils/constants/app_strings.dart';
import '../../core/utils/style/colors/general_colors.dart';
import '../../core/utils/style/themes/text_styles.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    super.initState();
    dev.log(Modular.to.path, name: kPath);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kColorBackgroundWhite,
      appBar: myAppBar(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.6,
              child: Lottie.asset(
                'assets/checkout/json/order_placed.json',
                repeat: false,
              ),
            ),
            Text(
              kOrderPlaced,
              style: TextStyles.headline1(),
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 40.0, right: 40.0, top: 16.0),
              child: Text(
                kOrderPlacedMessage,
                style: TextStyles.bodyText2(),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: MyButtonWidget(
                titleButton: kMyOrders,
                onPressed: () {},
                isSharedButton: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
