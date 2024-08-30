import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/controller/home_controller.dart';
import '../../home/model/home_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeModel model = Get.arguments;
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.quotesGetData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.name}"),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/detail_src.avif"),fit: BoxFit.cover
            )
        ),
        child: ListView.builder(
          itemCount: model.authorList!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          'edit',
                          arguments: [
                            model.authorList![index],
                            model.quotesList![index],
                            model.imageList![index],
                            model.name![index],
                          ],);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black,strokeAlign: 0.5),
                              gradient: LinearGradient(colors: [
                                Colors.white12.withOpacity(0.5),
                                Colors.white12.withOpacity(0.5),
                              ])
                          ),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${model.quotesList![index]}",
                                  style: const TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text("~${model.authorList![index]}",style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ),
                ),
                const SizedBox(height: 20,)
              ],
            );
          },),
      ),
    );
  }
}