
import 'package:akar_app/core/presentation/screens/home/state_management/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

MultiProvider providers({Widget? child}){
  return MultiProvider(providers: [
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
    // todo ==> inset all the new implemented providers here.
  ], child: child,);
}