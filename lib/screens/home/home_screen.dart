import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mt_fitpage/helper/my_helper.dart';

import 'controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MT Fitpage',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() => Container(
            child: scanList(),
          )),
    );
  }

  Widget scanList() {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => controller.onTileClick(index),
            title: Text(
              controller.data[index].name!,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            subtitle: Text(
              controller.data[index].tag!,
              style: TextStyle(
                  color: myHelper.getColor(controller.data[index].color!)),
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: Colors.black12),
        itemCount: controller.data.length);
  }
}
