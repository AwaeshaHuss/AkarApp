import 'package:akar_app/core/presentation/screens/home/home_screens/home_screen.dart';
import 'package:akar_app/core/presentation/shared_widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AkarNavigations{

  AkarNavigations._();

  static Map<String, WidgetBuilder> routes = {
    bottomNavBar: (context) => const BottomNavBar(),
    homeScreen: (context) => const HomeScreen(),
  };

  static const String bottomNavBar = BottomNavBar.id;
  static const String homeScreen = HomeScreen.id;































static Future<dynamic> navigator(BuildContext context,
      {required String route,
      bool popPreviousPages = false,
      bool isPushNamedAndRemoveUntil = false}) async {
    return Future<dynamic>.delayed(Duration.zero, () {
      if (isPushNamedAndRemoveUntil) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
      } else {
        if (!popPreviousPages) {
          return Navigator.pushNamed(context, route);
        } else {
          return Navigator.pushReplacementNamed(context, route);
        }
      }
    });
  }

  static void back(BuildContext context, String route) {
    Navigator.canPop(context) ?
    Navigator.pop(context) : navigator(context, route: route);
  }

  static String getCurrentRouteName(BuildContext context) {
    final currentRoute = ModalRoute.of(context);
    final route = currentRoute?.settings;
    final routeName = route?.name;
    //  log('==CURRENT_ROUTE==\n$routeName\n====');
    return routeName ?? '';
  }
}