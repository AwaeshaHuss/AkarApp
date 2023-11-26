import 'package:akar_app/core/presentation/screens/home/state_management/providers/home_provider.dart';
import 'package:akar_app/core/presentation/widgets/fade_in_network_widget.dart';
import 'package:akar_app/utils/base/akar_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DotedCarouselWidget extends StatelessWidget {
  const DotedCarouselWidget({
    super.key,
    required this.height,
    required this.homeProvider,
    required this.width,
    required this.state,
  });

  final dynamic state;
  final double height;
  final HomeProvider homeProvider;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height * .365,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, _) =>
                homeProvider.changeCarouselIndex(index),
          ),
          items: [...state.homeContainer?.headerGallery ?? []].map((e) {
            return Builder(
              builder: (BuildContext context) {
                return FadeInNetworkWidget(
                  width: width,
                  height: height,
                  item: e,
                );
              },
            );
          }).toList(),
        ),
        PositionedDirectional(
            top: 64,
            end: 20,
            child: SizedBox(
                width: 36,
                height: 36,
                child: SvgPicture.asset(AkarIcons.backIcon))),
        PositionedDirectional(
            bottom: 10,
            start: 10,
            child: DotsIndicator(
                dotsCount: state.homeContainer?.headerGallery?.length ?? 0,
                position: homeProvider.carouselIndex,
                decorator: DotsDecorator(
                    size: const Size.square(8.0),
                    activeSize: const Size(22.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)))))
      ],
    );
  }
}
