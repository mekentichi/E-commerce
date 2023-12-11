import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/verifyecodedata.dart';
import '../../views/auth/success_signup.dart';

abstract class LoginController extends GetxController {
  //goToVerifyCode();
  goToSuccesSignUp(verificationCode);
}

class VerifyEmailControllerImp extends LoginController {
  late String verifycode;
  String? email;

  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  List data = [];

  StatusRequest? statusrequest;

  @override
  goToSuccesSignUp(verificationCode) async {
    statusrequest = StatusRequest.loading;
    var response = await verifyCodeData.postData(email!, verificationCode);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        Get.off(SucessSignUp());
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
  reSend()  {
     verifyCodeData.resendData(email!);
   
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {}
}
