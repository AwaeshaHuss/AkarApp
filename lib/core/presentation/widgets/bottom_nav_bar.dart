import 'dart:developer';

import 'package:akar_app/core/presentation/screens/home/home_screens/home_screen.dart';
import 'package:akar_app/utils/base/base_utils_export.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = '/BottomNavBar';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  late List<Map<String, dynamic>> _screensListWithOnSelectAction;

  @override
  Widget build(BuildContext context) {
    log('screen size: ${getScreenHeight(context)}');
    _screensListWithOnSelectAction = [
      {
        'widget': const Scaffold(
          backgroundColor: Colors.white,
        ),
        'onSelect': () {}
      },
      {
        'widget': const Scaffold(
          backgroundColor: Colors.white,
        ),
        'onSelect': () {}
      },
      {
        'widget': const Scaffold(
          backgroundColor: Colors.white,
        ),
        'onSelect': () {}
      },
      {
        'widget': const Scaffold(
          backgroundColor: Colors.white,
        ),
        'onSelect': () {}
      },
      {'widget': const HomeScreen(), 'onSelect': () {}},
    ];
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: getScreenHeight(context) * .0925,
          backgroundColor: AkarColors.white_1,
          color: AkarColors.blue_1,
          buttonBackgroundColor: AkarColors.transparent,
          animationDuration: Durations.short4,
          items: [
            navItem(AkarIcons.moreNavIcon, 'More', _page == 0),
            navItem(AkarIcons.ordersNavIcon, 'OrdersScreen', _page == 1),
            navItem(AkarIcons.mapNavIcon, 'MapScreen', _page == 2),
            navItem(AkarIcons.searchNavIcon, 'SearchScreen', _page == 3),
            navItem(AkarIcons.homeNavIcon, 'HomeScreen', false),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: GestureDetector(
          onTap: _screensListWithOnSelectAction[_page]['onSelect'],
          child: _screensListWithOnSelectAction
              .map<Widget>((e) => e['widget'])
              .toList()[_page],
        ));
  }

  CurvedNavigationBarItem navItem(asset, txt, bool isSelected) =>
      CurvedNavigationBarItem(
        child: (txt != 'HomeScreen')
            ? SvgPicture.asset(
                asset,
                color: isSelected ? AkarColors.blue_1 : AkarColors.white_1,
              )
            : SvgPicture.asset(
                asset,
              ),
        label: txt,
        labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AkarColors.white_1,
            ),
      );
}
