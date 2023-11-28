import 'dart:developer';
import 'dart:io';

import 'package:akar_app/core/presentation/screens/home/home_widgets/upper_categories_widget.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/home_blocs/home_bloc.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/home_blocs/home_event.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/home_blocs/home_state.dart';
import 'package:akar_app/core/presentation/screens/home/home_http_methods_impl/home_http_methods_impl.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/providers/home_provider.dart';
import 'package:akar_app/core/presentation/shared_widgets/dotted_carousel_widget.dart';
import 'package:akar_app/core/presentation/shared_widgets/fade_in_network_widget.dart';
import 'package:akar_app/core/presentation/shared_widgets/loading_indicator.dart';
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
                          model: state.homeContainer?.headerGallery,
                          height: height,
                          homeProvider: homeProvider,
                          width: width,
                          backButtonVisible: true,
                          stacked: true,
                        ),
                        16.height,
                        UpperCategoriesWidget(
                          height: height,
                          width: width,
                          state: state,
                        ),
                        16.height,
                        DotedCarouselWidget(
                            height: height * .425,
                            homeProvider: homeProvider,
                            width: width * .95,
                            model: state.homeContainer?.headerOffers,
                            backButtonVisible: false,
                            stacked: false,
                            ),
                            16.height,
                            Padding(
                              padding: const EdgeInsetsDirectional.only(start: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(state.homeContainer?.latestprojectssectiontilte ?? '', style: AkarTextStyles.zawiRegular14.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: AkarColors.blue_1,
                                  ),),
                                ],
                              ),
                            ),
                            16.height,
                            // latestProjects.items[index] => GridView => check for a cool gridView pub that fits the UI for this section of the screen.
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
