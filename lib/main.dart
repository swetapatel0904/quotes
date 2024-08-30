import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/utils/ruotes_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routes,
      )
  );
}