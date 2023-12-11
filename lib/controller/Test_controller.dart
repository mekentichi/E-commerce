import 'package:get/get.dart';

import '../services/services.dart';

abstract class TestController extends GetxController {
  initialData();
}

class TestControllerImp extends TestController {
  MyServices myServices = Get.find();
  String? username;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
