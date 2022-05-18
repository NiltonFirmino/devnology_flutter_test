import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarouselHomeWidget extends StatefulWidget {
  final String cardImage01;
  final String cardImage02;
  final String cardImage03;

  const CarouselHomeWidget({
    Key? key,
    required this.cardImage01,
    required this.cardImage02,
    required this.cardImage03,
  }) : super(key: key);

  @override
  State<CarouselHomeWidget> createState() => _CarouselHomeWidgetState();
}

class _CarouselHomeWidgetState extends State<CarouselHomeWidget> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.90);
  }

  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    List<String> lastestCarousel = [
      'assets/home/carousel/${widget.cardImage01}.png',
      'assets/home/carousel/${widget.cardImage02}.png',
      'assets/home/carousel/${widget.cardImage03}.png',
    ];
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: lastestCarousel.length,
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: (page) {
          setState(
            () {
              activePage = page;
            },
          );
        },
        itemBuilder: (context, pagePosition) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: Image.asset(lastestCarousel[pagePosition]).image,
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
