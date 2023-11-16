import 'package:akar_app/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:akar_app/utils/base/base_utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: AkarThemes.lightTheme,
      routes: AkarNavigations.routes,
      home: const BottomNavBar()
    );
  }
}
