import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/screen/home/controller/home_controller.dart';
import 'package:quotes/utils/db_helper.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  HomeController controller = Get.put(HomeController());

  void initState() {
    // TODO: implement initState
    super.initState();
    controller.likeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Obx(
                () => Expanded(
              child: ListView.builder(
                itemCount: controller.favouriteList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        "${controller.favouriteList[index].quotes}",
                        style: TextStyle(fontSize: 18, fontFamily: "f6"),
                      ),
                      subtitle: Text(
                        "- ${controller.favouriteList[index].author}",
                        style: TextStyle(fontSize: 18, fontFamily: "f6"),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "are you sure?",
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  DBHelper.helper.deleteQuery(
                                      controller.favouriteList[index].id!);
                                  controller.likeData();
                                  Get.back();
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}