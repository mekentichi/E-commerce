import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/auth/login.dart';

abstract class SuccessReseatPasswordController extends GetxController {
  goToLogin();
}

class SuccessReseatPasswordControllerImp
    extends SuccessReseatPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  goToLogin() {
    Get.offAll(Login());
  }
}
