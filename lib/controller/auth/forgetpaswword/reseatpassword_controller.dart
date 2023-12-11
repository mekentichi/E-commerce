import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/forgetpassword/reseatpasswordtdata.dart';
import '../../../views/auth/forgetpassword/success_reseatpassword.dart';


abstract class LoginController extends GetxController {
  goToSuccessReseatPassword();
}

class ReseatPasswordControllerImp extends LoginController {
  ReseatPasswordData reseatPasswordData = ReseatPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? email;
  StatusRequest? statusrequest;
  late TextEditingController password;
  late TextEditingController repassword;
  bool isshowpassword = true;
  bool isshowrepassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    isshowrepassword = isshowrepassword == true ? false : true;

    update();
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
  }

  @override
  goToSuccessReseatPassword() async {
    var formdata = formstate.currentState;
    if (password.text == repassword.text) {
      //return Get.defaultDialog(title: 'warning');
      if (formdata!.validate()) {
        statusrequest = StatusRequest.loading;
        update();

        var response = await reseatPasswordData.getData(email!, password.text);
        statusrequest = handilingData(response);
        print(statusrequest);
        if (StatusRequest.success == statusrequest) {
          if (response['status'] == "success") {
            Get.offAll(SucessReseatPassword());
            //data.addAll(response['data']);
          } else {
            Get.defaultDialog(
                title: "error", content: const Text('password or email not correct'));
            statusrequest = StatusRequest.failure;
          }
        } else {
          return statusrequest;
        }
        update();
      } else {
        print('not valid');
      }
    } else {
      Get.defaultDialog(title: 'warning', content: const Text('password not match'));
    }
  }
}
