import 'dart:developer';

import 'package:akar_app/core/presentation/screens/home/home_screens/home_screen.dart';
import 'package:akar_app/core/presentation/widgets/text_handler.dart';
import 'package:akar_app/utils/base/akar_icons.dart';
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
      {'widget': const HomeScreen(), 'onSelect': () {}},
      {'widget': const Scaffold(backgroundColor: Colors.white,), 'onSelect': (){}},
      {'widget': const Scaffold(backgroundColor: Colors.white,), 'onSelect': (){}},
      {'widget': const Scaffold(backgroundColor: Colors.white,), 'onSelect': (){}},
      {'widget': const Scaffold(backgroundColor: Colors.white,), 'onSelect': (){}},
    ];
    return Scaffold(
      // todo ==> replace this icons with the ones sent by tharwat.
        bottomNavigationBar: CurvedNavigationBar(
          height: getScreenHeight(context) * .0925,
          backgroundColor: AkarColors.white_1,
          color: AkarColors.blue_1,
          buttonBackgroundColor: AkarColors.transparent,
          items: [
            navItem(AkarIcons.searchNavIcon, 'SearchScreen'),
            navItem(AkarIcons.mapNavIcon, 'MapScreen'),
            navItem(AkarIcons.ordersNavIcon, 'OrdersScreen'),
            navItem(AkarIcons.moreNavIcon, 'More'),
            navItem(AkarIcons.homeNavIcon, 'HomeScreen'),
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

  CurvedNavigationBarItem navItem(asset, txt) => CurvedNavigationBarItem(
    child: SvgPicture.asset(asset),
    label: txt,
    labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
      color: AkarColors.white_1,
    )
  );
}


/*

Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    //Page change using state does the same as clicking index 1 navigation button
                    final CurvedNavigationBarState? navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState?.setPage(1);
                  },
                )
              ],
            ),
          ),

 */