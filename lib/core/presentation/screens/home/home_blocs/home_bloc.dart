import 'dart:convert';
import 'dart:developer';

import 'package:akar_app/core/presentation/screens/home/home_http_methods_impl/home_http_methods_impl.dart';
import 'package:akar_app/core/presentation/screens/home/home_blocs/home_event.dart';
import 'package:akar_app/core/presentation/screens/home/home_blocs/home_state.dart';
import 'package:akar_app/core/presentation/screens/home/home_models/home_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final HomeHttpMethodsImpl homeHttpMethodsImpl;
  HomeBloc({required this.homeHttpMethodsImpl}): super(const HomeState()) {
    on<GetHomeListEvent>(_getHomeList);
  }

  static HomeBloc get(context) => BlocProvider.of(context);

  void _getHomeList(GetHomeListEvent event, Emitter<HomeState> emit) async{
    emit(state.copyWith(status: HomeStateStatus.initial));
    Either<Fail, Response> result;
    result = await homeHttpMethodsImpl.getHomeList();
    result.fold((l) {
      emit(state.copyWith(status: HomeStateStatus.error));
    }, 
    (r) {
      HomeContainer homeContainer = HomeContainer.fromJson(jsonDecode(r.body));
      // todo ==> split homeContainer in HomeStateStatus into a peices same as the Model names.
      emit(state.copyWith(status: HomeStateStatus.success, homeContainer: homeContainer));
    });
  }
}