import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/forgetpassword/checkemaildata.dart';
import '../../../views/auth/forgetpassword/verifycode.dart';

abstract class ForgetPasswordController extends GetxController {
  chekEmail();
}

class ForgetPasswordControllerIm extends ForgetPasswordController {
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  StatusRequest? statusrequest;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  chekEmail() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      var response = await checkEmailData.getData(email.text);
      statusrequest = handilingData(response);
      print(statusrequest);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          Get.offAll(VerifyCode(), arguments: {"email": email.text});
          //data.addAll(response['data']);
        } else {
          Get.defaultDialog(title: "error", content: Text('email not correct'));
          statusrequest = StatusRequest.failure;
        }
      } else {
        return statusrequest;
      }
      update();
    } else {
      print('not valid');
    }
  }
}
