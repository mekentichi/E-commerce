
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/logindata.dart';
import '../../services/services.dart';
import '../../views/admin/adminhome.dart';
import '../../views/auth/forgetpassword/forgotpassword.dart';
import '../../views/auth/forgetpassword/verifycode.dart';
import '../../views/auth/signup.dart';
import '../../views/users/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../views/users/screenhome.dart';

abstract class LoginController extends GetxController {
  goToSignUp();
  goToForgetPassword();
  login();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  StatusRequest? statusrequest;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  goToSignUp() {
    Get.offAll(SignUp());
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusrequest = StatusRequest.loading;
      update();
var response = await loginData.getData(email.text, password.text);
      statusrequest = handilingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          if (response['data']['users_etats'] == 'users') {
            myServices.sharedPreferences
                .setString('id', response['data']['users_id']);
            String usersid = myServices.sharedPreferences.getString("id")!;

            myServices.sharedPreferences
                .setString('username', response['data']['users_username']);

            myServices.sharedPreferences
                .setString('phone', response['data']['users_phone']);
            myServices.sharedPreferences
                .setString('email', response['data']['users_email']);
            myServices.sharedPreferences.setString('step', '2');
            FirebaseMessaging.instance.subscribeToTopic('users');
            FirebaseMessaging.instance.subscribeToTopic('users${usersid}');

            Get.offAll(ScreenHome());
          } else if (response['data']['users_etats'] == 'admin') {
            myServices.sharedPreferences
                .setString('id', response['data']['users_id']);
            String usersid = myServices.sharedPreferences.getString("id")!;
myServices.sharedPreferences.setString('step', '3');
            FirebaseMessaging.instance.subscribeToTopic('users');
            FirebaseMessaging.instance.subscribeToTopic('users${usersid}');
            Get.offAll(AdminHome());
          } else {
            Get.offAll(VerifyCode(), arguments: {"email": email.text});
          }
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
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print('==================================');
      print(value);
      print('==================================');

      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
  }

  @override
  goToForgetPassword() {
    Get.to(ForgetPassword());
  }
}
