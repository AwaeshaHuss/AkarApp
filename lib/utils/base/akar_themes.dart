import 'package:akar_app/utils/base/akar_colors.dart';
import 'package:akar_app/utils/base/base_utils_export.dart';
import 'package:flutter/material.dart';

class AkarThemes{

  AkarThemes._();

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // textStyle: BodyTextHelper.montserratRegular10,
        foregroundColor: AkarColors.white_1,
        backgroundColor: AkarColors.gray_1,
        minimumSize: const Size(130.0, 34.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
     buttonTheme: ButtonThemeData(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
       splashColor: AkarColors.gray_1,
       buttonColor: AkarColors.blue_1,
       height: 34.0,
       highlightColor: AkarColors.blue_2,
       textTheme: ButtonTextTheme.normal,
     ),
       textTheme: const TextTheme(
       bodyLarge:TextStyle(
           fontSize: 26.0,
           fontFamily: AkarFonts.zawiBlack,
           color: AkarColors.black_1,
           height: 2.0
       ),
       bodyMedium:TextStyle(
         fontSize: 14.0,
         fontFamily: AkarFonts.zawiBold,
         color: AkarColors.black_1,
         height: 1.8,
       ),
       bodySmall:TextStyle(
         fontSize: 10.0,
         fontFamily: AkarFonts.zawiRegular,
         color: AkarColors.black_1,
         height: 1.3,
       ),
     ),

  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark()
  );
}