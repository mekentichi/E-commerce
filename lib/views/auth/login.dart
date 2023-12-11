import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/alertexitapp.dart';
import '../../core/function/validinput.dart';
import '../../core/static/color.dart';
import '../../widget/auth/custombody.dart';
import '../../widget/auth/customlogo.dart';
import '../../widget/auth/customtextformfield.dart';
import '../../widget/auth/customtitle.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: const Color(0xFFFBE7E7),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign in',
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.headline2,
        ),
        // leading: IconButton(
        //     onPressed: () {
        //       Get.off(Login());
        //     },
        //     icon: const Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.black,
        //     )),
        backgroundColor: const Color(0xFFFBE7E7),
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
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
                                title: 'Welcome Back',
                              ),
                              const SizedBox(height: 20),
                              const CustomBody(
                                body:
                                    "Signe in with ypur email and password \n or continue with social media",
                              ),
                              const SizedBox(height: 40),
                              CustomFormField(
                                valid: (val) {
                                  return validInput(val!, 10, 50, "email");
                                },
                                mycontroller: controller.email,
                                obscureText: false,
                                label: const Text('Email'),
                                hint: "Enter your email",
                                prefix: const Icon(Icons.email),
                              ),
                              const SizedBox(height: 30),
                              GetBuilder<LoginControllerImp>(
                                builder: (controller) => CustomFormField(
                                  valid: (val) {
                                    return validInput(val!, 3, 30, "password");
                                  },
                                  mycontroller: controller.password,
                                  obscureText: controller.isshowpassword,
                                  hint: 'Enter your password',
                                  prefix: InkWell(
                                      onTap: () {
                                        controller.showPassword();
                                      },
                                      child: const Icon(Icons.remove_red_eye)),
                                  label: const Text('Password'),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: InkWell(
                                      onTap: () {
                                        controller.goToForgetPassword();
                                      },
                                      child: Text(
                                        'Forget Password ',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: AppColor.secondycolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              MaterialButton(
                                onPressed: () {
                                  controller.login();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.secondycolor,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 120, vertical: 18),
                                  child: const Text('Continue'),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    const Text("Dont't have an account"),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      onTap: () {
                                        controller.goToSignUp();
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.secondycolor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
