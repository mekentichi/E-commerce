import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/successsignup_controller.dart';
import '../../core/static/color.dart';

class SucessSignUp extends StatelessWidget {
  const SucessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(
                Icons.safety_check,
                size: 200,
                color: AppColor.secondycolor,
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  controller.goToLogin();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColor.secondycolor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 131, vertical: 18),
                  child: const Text('Go To Login'),
                ),
              ),
              SizedBox(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
