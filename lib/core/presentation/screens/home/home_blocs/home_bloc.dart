import 'package:akar_app/core/presentation/screens/home/home_blocs/home_event.dart';
import 'package:akar_app/core/presentation/screens/home/home_blocs/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc():  super(const HomeState()) {
    on<GetSomeListEvent>((event, emit) {});
  }
}