import 'package:akar_app/core/presentation/screens/home/home_blocs/home_bloc.dart';
import 'package:akar_app/core/presentation/screens/home/home_http_methods_impl/home_http_methods_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MultiBlocProvider blocProvides({required Widget child}) => MultiBlocProvider(providers: [
  BlocProvider(create: (context) => HomeBloc(homeHttpMethodsImpl: HomeHttpMethodsImpl())),
  // todo ==> add all blocProviders here...
], child: child);