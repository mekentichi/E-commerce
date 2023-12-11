import 'package:get/get.dart';

import '../../views/auth/login.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToLogin() {
    Get.offAll(Login());
  }
}
