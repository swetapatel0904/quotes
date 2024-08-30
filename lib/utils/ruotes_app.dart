import 'package:flutter/cupertino.dart';
import 'package:quotes/screen/detail/view/detail_screen.dart';
import 'package:quotes/screen/edit/view/edit_screen.dart';
import 'package:quotes/screen/favourite/view/favourite_screen.dart';
import 'package:quotes/screen/home/view/home_screen.dart';


Map<String,WidgetBuilder>app_routes={
  '/': (c1) => const HomeScreen(),
  'detail': (c1) => const DetailScreen(),
  'edit': (c1) => const EditScreen(),
  'favorite': (c1) => const FavoriteScreen(),
};