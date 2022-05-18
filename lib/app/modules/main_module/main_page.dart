import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/components/appbar_widget.dart';
import '../../core/data/mock_product_data_source.dart';
import '../../core/utils/constants/app_strings.dart';
import '../../core/utils/style/colors/general_colors.dart';
import 'main_bloc.dart';
import 'submodules/cart_module/cart_page.dart';
import 'submodules/home_module/home_page.dart';

class MainPage extends StatefulWidget {
  int? pageId;
  MainPage({
    Key? key,
    this.pageId,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = Modular.get<MainBloc>();
  int _selectedBody = 0;
  int numberItemsInCart = mockItemInCart;

  @override
  void initState() {
    super.initState();
    dev.log(Modular.to.path, name: kPath);
    initSelectedPage(widget.pageId);
  }

  static const List<Widget> _widgetBodyOptions = <Widget>[
    HomePage(),
    Center(child: Text(kSearch)),
    CartPage(),
    Center(child: Text(kProfile)),
    Center(child: Text(kMore)),
  ];
  void onItemTapped(int index) {
    setState(() {
      _selectedBody = index;
    });
  }

  void initSelectedPage(int? index) {
    if (index == null) {
      setState(() {
        _selectedBody = 0;
      });
    } else {
      setState(() {
        _selectedBody = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: myAppBar(
        isLeading: true,
        isActiveCart: false,
        isActiveActionsBar: true,
        numberItemsInCart: numberItemsInCart,
      ),
      body: _widgetBodyOptions.elementAt(_selectedBody),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: kHome,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: kSearch,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: kCart,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: kProfile,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: kMore,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedBody,
            selectedItemColor: kColorNavBarNotification,
            unselectedItemColor: kColorNavBarIcon,
            backgroundColor: kColorBackgroundSplash,
            onTap: onItemTapped,
          ),
          if (numberItemsInCart > 0)
            BottomAppBar(
              elevation: 0,
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.5,
                  top: 20,
                ),
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
              ),
            )
          else
            const BottomAppBar(),
        ],
      ),
    );
  }
}
