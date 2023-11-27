import 'package:akar_app/utils/base/akar_colors.dart';
import 'package:flutter/material.dart';

class LodingIndicatorWidget extends StatelessWidget {
  const LodingIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color?>(AkarColors.blue_1), strokeWidth: 2,),
    ),);
  }
}

