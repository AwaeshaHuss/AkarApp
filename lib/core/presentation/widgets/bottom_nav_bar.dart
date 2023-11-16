import 'package:akar_app/core/presentation/screens/home/home_screens/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = '/BottomNavBar';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  late List<Map<String, dynamic>> _screensListWithOnSelectAction;

  @override
  Widget build(BuildContext context) {
    _screensListWithOnSelectAction = [
      {'widget': const HomeScreen(), 'onSelect': () {}},
      {'widget': const Scaffold(backgroundColor: Colors.amber,), 'onSelect': (){}},
      {'widget': const Scaffold(backgroundColor: Colors.blue,), 'onSelect': (){}},
      {'widget': const Scaffold(backgroundColor: Colors.blueGrey,), 'onSelect': (){}},
    ];
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: const [
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.abc_outlined, size: 30,)
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