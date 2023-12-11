import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/forgetpaswword/succesreseatpassword_controller.dart';
import '../../../core/static/color.dart';

class SucessReseatPassword extends StatelessWidget {
  const SucessReseatPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SuccessReseatPasswordControllerImp controller =
        Get.put(SuccessReseatPasswordControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.safety_check,
                size: 200,
                color: Color(0xFFc09640),
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
