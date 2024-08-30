
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quotes/screen/category/model/category_model.dart';
import 'package:quotes/screen/db_model/model/db_model.dart';
import 'package:quotes/utils/db_helper.dart';
import 'package:quotes/utils/json_helper.dart';


import '../model/home_model.dart';

class HomeController extends GetxController {
  RxList<HomeModel> list = <HomeModel>[].obs;
  RxList<categoryModel> l1 = <categoryModel>[].obs;
  RxList<dbModel> favouriteList = <dbModel>[].obs;
  Rx<Color> onColor = Colors.black.obs;
  RxBool isOn = false.obs;
  RxBool FontOn = false.obs;
  RxBool imgOn = false.obs;
  RxBool color = false.obs;
  RxString onFont = "DancingScript".obs;
  RxList fontList = [
    "DancingScript",
    "IndieFlower",
    "Nerko",
    "NewRegular",
    "Roboto-black"
  ].obs;
  RxString onImg = "https://m.media-amazon.com/images/I/61wJHL09dRL.png".obs;

  Future<void> quotesGetData() async {
    List<HomeModel>? l1 = await JsonHelper.helper.getData();
    list.value = l1!;
  }

  Future<void> quotesCategory() async {
    List<categoryModel>? c1 = await DBHelper.helper.readCategory();
    l1.value = c1!;
  }

  Future<void> likeData() async {
    List<dbModel>? l1 = await DBHelper.helper.readQuery();
    favouriteList.value = l1!;
  }
}