import 'dart:developer';
import 'dart:io';

import 'package:akar_app/core/presentation/screens/home/state_management/home_blocs/home_bloc.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/home_blocs/home_event.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/home_blocs/home_state.dart';
import 'package:akar_app/core/presentation/screens/home/home_http_methods_impl/home_http_methods_impl.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/providers/home_provider.dart';
import 'package:akar_app/core/presentation/widgets/dotted_carousel_widget.dart';
import 'package:akar_app/core/presentation/widgets/fade_in_network_widget.dart';
import 'package:akar_app/core/presentation/widgets/loading_indicator.dart';
import 'package:akar_app/utils/base/base_utils_export.dart';
import 'package:akar_app/utils/config/extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    HomeBloc.get(context).add(GetHomeListEvent());
  }

  @override
  Widget build(BuildContext context) {
    double height = getScreenHeight(context);
    double width = getScreenWidth(context);
    final homeProvider = HomeProvider.watch(context);
    return SafeArea(
      top: false,
      right: false,
      left: false,
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<HomeBloc, HomeState>(
            // bloc: HomeBloc(homeHttpMethodsImpl: HomeHttpMethodsImpl()),
            buildWhen: (previous, current) =>
                current != previous && current.status.isLoading ||
                current.status.isSuccess,
            builder: (context, state) {
              return state.homeContainer == null ||
                      state.status != HomeStateStatus.success
                  ? const LodingIndicatorWidget()
                  : Column(
                      children: [
                        DotedCarouselWidget(
                            state: state,
                            height: height,
                            homeProvider: homeProvider,
                            width: width),
                            16.height,
                            SizedBox(
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
                                              item: state.homeContainer?.headerOffers?[index]),
                                              const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('${state.homeContainer?.headerOffers?[index].title}', style: AkarTextStyles.zawiRegular14.copyWith(fontSize: 16, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                            ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
