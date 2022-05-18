import 'package:flutter/material.dart';

import '../utils/style/colors/general_colors.dart';
import '../utils/style/themes/text_styles.dart';

class MyButtonWidget extends StatelessWidget {
  final String titleButton;
  final dynamic onPressed;
  final bool isSharedButton;
  const MyButtonWidget({
    Key? key,
    required this.titleButton,
    required this.onPressed,
    required this.isSharedButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.transparent,
      child: InkWell(
        onTap:onPressed,
        child: Container(
          width: 140,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSharedButton ? kColorBackgroundWhite : kColorButtonPrimary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titleButton,
                  style: TextStyles.button(
                      color:
                          isSharedButton ? kColorTextLight : kColorTextButton),
                ),
                Image.asset(isSharedButton
                    ? 'assets/core/icons/arrow_shared_button_icon.png'
                    : 'assets/core/icons/arrow_button_icon.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
