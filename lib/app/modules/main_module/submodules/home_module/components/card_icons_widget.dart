import 'package:flutter/material.dart';

import '../../../../../core/utils/style/themes/text_styles.dart';

class CardIconWidget extends StatelessWidget {
  final String icon;
  final String text;
  const CardIconWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Image.asset(
              'assets/home/icons/${icon}.png',
              height: 65,
              width: 65,
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text(
                text,
                style: TextStyles.subtitle1(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
