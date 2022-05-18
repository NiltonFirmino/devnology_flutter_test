import 'package:flutter/material.dart';

import '../../../../../core/utils/style/themes/text_styles.dart';

class CardItemCartWidget extends StatefulWidget {
  final String itemTitle;
  final String itemPrice;
  final String itemImage;
  final int itemTypeInTheCart;
  const CardItemCartWidget({
    Key? key,
    required this.itemTitle,
    required this.itemPrice,
    required this.itemImage,
    required this.itemTypeInTheCart,
  }) : super(key: key);

  @override
  State<CardItemCartWidget> createState() => _CardItemCartWidgetState();
}

class _CardItemCartWidgetState extends State<CardItemCartWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    if (widget.itemTypeInTheCart <= 0) {
      return Container();
    } else {
      return Row(
        children: [
          SizedBox(
            width: size * 0.3,
            child: Center(
              child: Image.asset(
                widget.itemImage,
              ),
            ),
          ),
          SizedBox(
            width: size * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.itemTitle,
                    style: TextStyles.bodyText1(),
                    maxLines: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    widget.itemPrice,
                    style: TextStyles.headline3(),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {},
                    ),
                    Text('${widget.itemTypeInTheCart}'),
                    IconButton(
                      icon: const Icon(Icons.add_circle),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
