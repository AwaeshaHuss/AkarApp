import 'package:akar_app/core/data/cache_helper/cache_helper.dart';
import 'package:akar_app/core/presentation/widgets/bottom_nav_bar.dart';
import 'package:akar_app/utils/base/base_utils_export.dart';
import 'package:akar_app/utils/config/bloc_providers.dart';
import 'package:akar_app/utils/config/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return blocProvides(
      child: providers(
        child: MaterialApp(
          title: appName,
          debugShowCheckedModeBanner: false,
          theme: AkarThemes.lightTheme,
          routes: AkarNavigations.routes,
          home: const BottomNavBar()
        ),
      ),
    );
  }
}
