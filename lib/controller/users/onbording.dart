
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/static/dataonboarding.dart';
import '../../services/services.dart';
import '../../views/auth/login.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pagecontroller;
  var currentpage = 0;
  MyServices myservices = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage > onboardinglist.length - 1) {
      myservices.sharedPreferences.setString('step', '1');
      Get.offAll(Login());
    } else {
      pagecontroller.animateToPage(currentpage,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
