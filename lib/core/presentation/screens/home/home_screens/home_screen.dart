import 'dart:developer';

import 'package:akar_app/core/presentation/screens/home/home_blocs/home_bloc.dart';
import 'package:akar_app/core/presentation/screens/home/home_blocs/home_event.dart';
import 'package:akar_app/core/presentation/screens/home/home_blocs/home_state.dart';
import 'package:akar_app/core/presentation/screens/home/home_http_methods_impl/home_http_methods_impl.dart';
import 'package:akar_app/core/presentation/widgets/loading_indicator.dart';
import 'package:akar_app/utils/base/base_utils_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    HomeBloc.get(context).add(GetHomeListEvent(id: 1));
  }

  @override
  Widget build(BuildContext context) {
    double height = getScreenHeight(context);
    double width = getScreenWidth(context);
    return SafeArea(
      right: false,
      left: false,
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<HomeBloc, HomeState>(
            bloc: HomeBloc(homeHttpMethodsImpl: HomeHttpMethodsImpl()),
            buildWhen: (c, p) => c != p,
            builder: (context, state) {
            log('homeResponse: ${state.homeContainer}, homeState: ${state.status}');
             return state.homeContainer == null || state.status != HomeStateStatus.success
             ? const LodingIndicatorWidget()
              : Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(height: height * .25),
                    items:  [...state.homeContainer?.headerGallery ?? []].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: width,
                              decoration:
                                  const BoxDecoration(color: Colors.amber));
                        },
                      );
                    }).toList(),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
