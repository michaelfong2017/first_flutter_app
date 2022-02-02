import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text('hello'.tr)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('hello'.tr),
            SizedBox(height: 20),
            DropdownButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              value: controller.selectedLangValue,
              items: controller.buildDropdownMenuItems(),
              onChanged: controller.onChangedDropdownMenuItem,
            ),
            Obx(() => Text('${'counter'.tr} ${controller.count}'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.increment,
      ));
}