import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/auth/forgetpaswword/reseatpassword_controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/validinput.dart';
import '../../../core/static/color.dart';
import '../../../widget/auth/custombody.dart';
import '../../../widget/auth/customlogo.dart';
import '../../../widget/auth/customtextformfield.dart';
import '../../../widget/auth/customtitle.dart';

class ReseatPassword extends StatelessWidget {
  ReseatPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReseatPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Reseat Password',
            // ignore: deprecated_member_use
            style: Theme.of(context).textTheme.headline2,
          ),
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.black,
          //     )),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: GetBuilder<ReseatPasswordControllerImp>(
          builder: (controller) => controller.statusrequest ==
                  StatusRequest.loading
              ? Center(
                  child: Lottie.asset("lottie/loading.json"),
                )
              : SafeArea(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const LogoAuth(),
                              const SizedBox(height: 10),
                              const CustomTitle(
                                title: 'New Password',
                              ),
                              const SizedBox(height: 20),
                              const CustomBody(
                                body: "Please Entre New Password",
                              ),
                              const SizedBox(height: 40),
                              CustomFormField(
                                valid: (val) {
                                  return validInput(val!, 5, 30, 'password');
                                },
                                mycontroller: controller.password,
                                obscureText: controller.isshowpassword,
                                label: const Text('New Password'),
                                hint: "Enter your new Password",
                                prefix: InkWell(
                                    onTap: () {
                                      controller.showPassword();
                                    },
                                    child: const Icon(Icons.remove_red_eye)),
                              ),
                              const SizedBox(height: 30),
                              CustomFormField(
                                valid: (val) {
                                  return validInput(val!, 5, 30, 'password');
                                },
                                mycontroller: controller.repassword,
                                obscureText: controller.isshowrepassword,
                                label: const Text('New rePassword'),
                                hint: "Enter your new rePassword",
                                prefix: InkWell(
                                    onTap: () {
                                      controller.showPassword();
                                    },
                                    child: const Icon(Icons.remove_red_eye)),
                              ),
                              const SizedBox(height: 30),
                              MaterialButton(
                                onPressed: () {
                                  controller.goToSuccessReseatPassword();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.secondycolor,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 131, vertical: 18),
                                  child: const Text('Save'),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
