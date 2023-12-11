import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/forgetpassword/verifycodeforgetpassworddata.dart';
import '../../../views/auth/forgetpassword/reseatpassword.dart';

abstract class LoginController extends GetxController {
  //goToVerifyCode();
  goToReseatPassword(verificationCode);
}

class VerifyCodeControllerImp extends LoginController {
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  String? email;
  StatusRequest? statusrequest;

  @override
  goToReseatPassword(verificationCode) async {
    statusrequest = StatusRequest.loading;
    var response =
        await verifyCodeForgetPasswordData.getData(email!, verificationCode);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        Get.off(ReseatPassword(), arguments: {"email": email});
        //data.addAll(response['data']);
      } else {
        Get.defaultDialog(
            title: "incorrect", content: const Text('code verify incorrect'));
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  reSend() {
    verifyCodeForgetPasswordData.resendData(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {}
}
