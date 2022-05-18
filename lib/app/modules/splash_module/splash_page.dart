import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/constants/app_routes.dart';
import '../../core/utils/constants/app_strings.dart';
import '../../core/utils/style/colors/general_colors.dart';
import 'splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Modular.get<SplashBloc>();
  @override
  void initState() {
    super.initState();
    dev.log(Modular.to.path, name: kPath);
    Future.delayed(const Duration(seconds: 4), () {
      Modular.to.pushReplacementNamed(kRouteMain);
    });
    Future.delayed(const Duration(seconds: 2), () {
      controller.animatedSize = 0.13;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kColorBackgroundSplash,
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: size * 0.8,
              height: size * 0.1,
              child: Center(
                child: SvgPicture.asset(
                  'assets/core/logo/name_devnology.svg',
                  semanticsLabel: kAppName,
                ),
              ),
            ),
            SizedBox(
              width: size * 0.8,
              height: size * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    width: size * controller.animatedSize,
                    height: size * 0.1,
                    color: kColorBackgroundSplash,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/core/logo/left_arrow.png',
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    width: size * controller.animatedSize,
                    height: size * 0.1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    color: kColorBackgroundSplash,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/core/logo/right_arrow.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
