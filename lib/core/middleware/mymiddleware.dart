import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

import '../../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myservices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: '/splashscreen');
    }
    if (myservices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: '/splashscreenlogin');
    }
    if (myservices.sharedPreferences.getString('step') == '3') {
      return const RouteSettings(name: '/adminsplachscreen');
    }
  }
}
