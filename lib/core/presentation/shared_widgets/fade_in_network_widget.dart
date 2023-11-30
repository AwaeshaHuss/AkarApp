import 'package:akar_app/utils/base/akar_colors.dart';
import 'package:akar_app/utils/base/akar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FadeInNetworkWidget extends StatelessWidget {
  const FadeInNetworkWidget({
    super.key,
     this.width,
     this.height,
    required this.image,
    this.fit = BoxFit.fill,
  });

  final double? width;
  final double? height;
  final dynamic image;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
     width: width, 
     placeholder: AkarIcons.placeHolder, image: image ?? '',
     fit: fit,
     placeholderErrorBuilder: (BuildContext context, Object error,
                StackTrace? stackTrace) {
          return Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              color: AkarColors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: SvgPicture.asset(
              AkarIcons.placeHolder,
              width: width,
              height: height,
            )),
          );
        },
        imageErrorBuilder: (BuildContext context,
            Object error, StackTrace? stackTrace) {
          return Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              color: AkarColors.blue_2,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: SvgPicture.asset(
              AkarIcons.placeHolder,
              width: width,
              height: height,
            )),
          );
        },
        );
  }
}