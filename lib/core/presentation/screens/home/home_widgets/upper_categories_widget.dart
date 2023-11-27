
import 'package:akar_app/core/presentation/shared_widgets/fade_in_network_widget.dart';
import 'package:akar_app/utils/base/akar_colors.dart';
import 'package:akar_app/utils/base/akar_text_styles.dart';
import 'package:flutter/material.dart';

class UpperCategoriesWidget extends StatelessWidget {
  const UpperCategoriesWidget({
    super.key,
    required this.height,
    required this.width,
    required this.state,
  });

  final dynamic state;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .1825,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: state.homeContainer?.headerOffers?.length ?? 0,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 4.0),
            child: SizedBox(
              width: width * .3125,
              child: Card(
                elevation: .25,
                color: AkarColors.gray_2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    const Spacer(),
                    FadeInNetworkWidget(
                      width: width * .25, height: height,
                      image: state.homeContainer?.headerOffers?[index].image),
                      const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${state.homeContainer?.latestProjects?.items?[index].title}', style: AkarTextStyles.zawiRegular14.copyWith(fontSize: 16, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
