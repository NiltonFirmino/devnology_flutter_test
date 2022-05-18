import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style/colors/general_colors.dart';

AppBar myAppBar({
  final bool isLeading = false,
  final bool isActiveCart = false,
  final bool isActiveActionsBar = false,
  final int numberItemsInCart = 0,
}) {
  return AppBar(
    elevation: 0,
    title: isLeading == false
        ? SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/core/logo/logo_devnology.png',
                  width: 160,
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 1.0),
            child: Image.asset('assets/core/logo/logo_devnology.png', width: 160),
          ),
    backgroundColor: kColorBackgroundSplash,
    actions: [
      if (isActiveCart == true)
        Stack(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/core/icons/cart_icon.svg',
                semanticsLabel: 'cart',
              ),
              onPressed: () {},
            ),
               if (numberItemsInCart > 0)
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 30.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: kColorNavBarNotification,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      '$numberItemsInCart',
                      style: const TextStyle(
                        color: kColorSecondaryLight,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            else
              Container(),
          ],
        )
      else
        const SizedBox(width: 48),
      if (isActiveActionsBar == true)
        IconButton(
          icon: SvgPicture.asset(
            'assets/core/icons/message_icon.svg',
            semanticsLabel: 'cart',
          ),
          onPressed: () {},
        )
      else
        Container(),
      if (isActiveActionsBar == true)
        IconButton(
          icon: SvgPicture.asset(
            'assets/core/icons/notification_icon.svg',
          ),
          onPressed: () {},
        )
      else
        Container(),
    ],
  );
}
