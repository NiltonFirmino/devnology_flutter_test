import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../item_details_bloc.dart';

class CarouselItemDetailsWidget extends StatefulWidget {
  final List carouselItemDetails;
  const CarouselItemDetailsWidget({
    Key? key,
    required this.carouselItemDetails,
  }) : super(key: key);

  @override
  State<CarouselItemDetailsWidget> createState() =>
      _CarouselItemDetailsWidgetState();
}

class _CarouselItemDetailsWidgetState extends State<CarouselItemDetailsWidget> {
  
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    Modular.get<ItemDetailsBloc>();
    super.initState();
  }

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    final List carouselItemDetails = widget.carouselItemDetails;
    List<Widget> indicators(imagesLength, currentIndex) {
      return List<Widget>.generate(imagesLength, (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: currentIndex == index ? Colors.black : Colors.black26,
              shape: BoxShape.circle),
        );
      });
    }

    var size = MediaQuery.of(context).size.width;
    return Column(
      
      children: [
        SizedBox(
          width: size * 0.5,
          height: 200,
          child: PageView.builder(
              itemCount: carouselItemDetails.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(carouselItemDetails[pagePosition]),
                );
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(carouselItemDetails.length, activePage))
      ],
    );
  }
}
