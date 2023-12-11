import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/signupdata.dart';
import '../../views/auth/login.dart';
import '../../views/auth/verifyemail.dart';

abstract class SignUpController extends GetxController {
  goToLogIn();
  signUp();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  bool isshowpassword = true;
  SignupData signupData = SignupData(Get.find());

  List data = [];
  StatusRequest? statusrequest;
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  goToLogIn() {
    Get.offAll(Login());
  }

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
      var response = await signupData.getData(
          username.text, email.text, phone.text, password.text);
      statusrequest = handilingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          Get.offAll(VerifyEmail(), arguments: {"email": email.text});
          //data.addAll(response['data']);
        } else {
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

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
  }
}
