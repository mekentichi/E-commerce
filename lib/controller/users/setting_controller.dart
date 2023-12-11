import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import '../../services/services.dart';
import '../../views/auth/login.dart';

class SettingController extends GetxController {
  MyServices myServices = Get.find();

  logOut() {
    String usersid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic('users');
    FirebaseMessaging.instance.unsubscribeFromTopic('users${usersid}');

    myServices.sharedPreferences.clear();
    Get.offAll(Login());
  }
}
