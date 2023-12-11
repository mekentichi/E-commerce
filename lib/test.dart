import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/Test_controller.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    TestControllerImp controller = Get.put(TestControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text('page test'),
      ),
      body: Center(
        child: Text('${controller.id}'),
      ),
    );
  }
}
