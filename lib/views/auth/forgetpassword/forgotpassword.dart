import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/auth/forgetpaswword/forgetpassword_controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/validinput.dart';
import '../../../core/static/color.dart';
import '../../../widget/auth/custombody.dart';
import '../../../widget/auth/customlogo.dart';
import '../../../widget/auth/customtextformfield.dart';
import '../../../widget/auth/customtitle.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerIm());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Forget Password',
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
        body: GetBuilder<ForgetPasswordControllerIm>(
          builder: (controller) =>
              controller.statusrequest == StatusRequest.loading
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
                                    title: 'Check Email',
                                  ),
                                  const SizedBox(height: 20),
                                  const CustomBody(
                                    body:
                                        "Please Entre Your Email Adresse To Recieve A Verify Code",
                                  ),
                                  const SizedBox(height: 40),
                                  CustomFormField(
                                    valid: (val) {
                                      return validInput(val!, 10, 50, 'email');
                                    },
                                    mycontroller: controller.email,
                                    obscureText: false,
                                    label: const Text('Email'),
                                    hint: "Enter your email",
                                    prefix: const Icon(Icons.email),
                                  ),
                                  const SizedBox(height: 30),

                                  //const SizedBox(height: 20),
                                  MaterialButton(
                                    onPressed: () {
                                      controller.chekEmail();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: AppColor.secondycolor,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 131, vertical: 18),
                                      child: const Text('Check'),
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
