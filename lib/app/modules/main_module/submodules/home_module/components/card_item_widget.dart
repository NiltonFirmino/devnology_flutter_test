import 'package:flutter/material.dart';

import '../../../../../core/utils/style/themes/text_styles.dart';

class CardItemWidget extends StatelessWidget {
  final String imageItem;
  final String titleItem;
  final String priceItem;
  const CardItemWidget({
    Key? key,
    required this.imageItem,
    required this.titleItem,
    required this.priceItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: 170,
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(imageItem).image,
                  fit: BoxFit.fitWidth,
                ),),
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(titleItem, style: TextStyles.caption(),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 10, right: 8.0),
            child: Text(priceItem, style: TextStyles.bodyText1(),),
          ),
        ],
      ),
    );
  }
}
