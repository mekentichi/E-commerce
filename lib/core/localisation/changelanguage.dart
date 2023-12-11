import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../services/services.dart';
import '../function/fcmconfig.dart';

class localLanguage extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmcConfig();
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
    } else if (sharedPrefLang == 'fr') {
      language = const Locale('fr');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
