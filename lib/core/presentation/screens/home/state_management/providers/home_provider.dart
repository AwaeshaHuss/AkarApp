import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier{
  static HomeProvider watch(context)=> Provider.of<HomeProvider>(context,); ///watch-function to get variables
  static HomeProvider read(context)=> Provider.of<HomeProvider>(context,listen: false); ///read-function to implement functions

  int _carouselIndex = 0;
  int get carouselIndex => _carouselIndex;
  void set carouselIndex(int index) => _carouselIndex = index;
  void changeCarouselIndex(int index){
    carouselIndex = index;
    notifyListeners();
  }
}