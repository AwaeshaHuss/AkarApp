import 'package:akar_app/core/presentation/screens/home/home_widgets/upper_categories_widget.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/home_blocs/home_bloc.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/home_blocs/home_event.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/home_blocs/home_state.dart';
import 'package:akar_app/core/presentation/screens/home/state_management/providers/home_provider.dart';
import 'package:akar_app/core/presentation/shared_widgets/dotted_carousel_widget.dart';
import 'package:akar_app/core/presentation/shared_widgets/loading_indicator.dart';
import 'package:akar_app/core/presentation/shared_widgets/widgets_export.dart';
import 'package:akar_app/utils/base/base_utils_export.dart';
import 'package:akar_app/utils/config/extensions.dart';
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
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: 
          BlocBuilder<HomeBloc, HomeState>(
            // bloc: HomeBloc(homeHttpMethodsImpl: HomeHttpMethodsImpl()),
            buildWhen: (previous, current) =>
                current != previous && current.status.isLoading ||
                current.status.isSuccess,
            builder: (context, state) {
              return state.homeContainer == null ||
                      state.status != HomeStateStatus.success
                  ? const LodingIndicatorWidget()
                  : ListView(
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
                            // card => column => image, 
                            // row => image, text
                            // text
                            Container(
                              height: height * .275,
                              width: double.infinity,
                              padding: const EdgeInsets.all(7.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state.homeContainer?.latestProjects?.items?.length ?? 0,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Container(
                                    width: width * .36125,
                                    decoration: const BoxDecoration(
                                      color: AkarColors.white_2,
                                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                                    ),
                                    child: Card(
                                    elevation: 1.125,
                                    child: SingleChildScrollView(
                                      physics: const NeverScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ClipRRect(
                                              borderRadius: const BorderRadius.only(topRight: Radius.circular(12.0), topLeft: Radius.circular(12.0)),
                                              child: FadeInNetworkWidget(image: state.homeContainer?.latestProjects?.items?[index].image)),
                                              6.height,
                                              Row(
                                                children: [
                                                  FadeInNetworkWidget(image: state.homeContainer?.latestProjects?.items?[index].icon ?? ''),
                                              6.width,
                                              SizedBox(
                                              width: width * .25,
                                              child: Text('${state.homeContainer?.latestProjects?.items?[index].title ?? 'title'}', overflow: TextOverflow.ellipsis, maxLines: 3,))
                                                ],
                                              ),
                                              6.height,
                                              Center(child: Text('${state.homeContainer?.latestProjects?.description ?? 'description'}'))
                                        ],
                                      ),
                                    ),
                                                                  ),
                                  ),
                                )),
                            )
                      ],
                    );
            },
          ),
        ),
    );
  }
}


/*

Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7.0),
                              width: width,
                              height: height * .25,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state.homeContainer?.latestProjects?.items?.length ?? 0,
                                itemBuilder: (context, index) => Card(
                                color: AkarColors.white_2,
                                elevation: 1.125,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(topRight: Radius.circular(12.0), topLeft: Radius.circular(12.0)),
                                        child: FadeInNetworkWidget(width: width * .275, height: height * .125, image: state.homeContainer?.latestProjects?.items?[index].image)),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FadeInNetworkWidget(width: width * .125, height: height * .1, image: state.homeContainer?.latestProjects?.items?[index].icon ?? ''),
                                            SizedBox(
                                              width: width * .3125,
                                              child: Text('${state.homeContainer?.latestProjects?.items?[index].title ?? 'title'}', overflow: TextOverflow.ellipsis, maxLines: 1,))
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                              ),),
                            ),

*/