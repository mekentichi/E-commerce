import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/signup_controller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/validinput.dart';
import '../../core/static/color.dart';
import '../../widget/auth/custombody.dart';
import '../../widget/auth/customtextformfield.dart';
import '../../widget/auth/customtitle.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Sign up',
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
        body: GetBuilder<SignUpControllerImp>(
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
                              const SizedBox(height: 10),
                              const CustomTitle(
                                title: 'Welcome Back',
                              ),
                              const SizedBox(height: 20),
                              const CustomBody(
                                body:
                                    "Signe up with ypur email and password \n or continue with social media",
                              ),
                              const SizedBox(height: 40),
                              CustomFormField(
                                valid: (val) {
                                  return validInput(val!, 3, 30, 'username');
                                },
                                mycontroller: controller.username,
                                obscureText: false,
                                label: const Text('Username'),
                                hint: "Enter your username",
                                prefix: const Icon(Icons.person),
                              ),
                              const SizedBox(height: 30),
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
                              GetBuilder<SignUpControllerImp>(
                                builder: (controller) => CustomFormField(
                                  valid: (val) {
                                    return validInput(val!, 5, 30, 'password');
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
                              const SizedBox(height: 30),
                              CustomFormField(
                                type: TextInputType.phone,
                                valid: (val) {
                                  return validInput(val!, 5, 20, 'phone');
                                },
                                mycontroller: controller.phone,
                                obscureText: false,
                                hint: 'Enter your phone',
                                prefix: const Icon(Icons.phone_android),
                                label: const Text('Phone'),
                              ),
                              const SizedBox(height: 15),
                              const SizedBox(height: 20),
                              MaterialButton(
                                onPressed: () {
                                  controller.signUp();
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
                                    const Text("have an account"),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      onTap: () {
                                        controller.goToLogIn();
                                      },
                                      child: Text(
                                        'Sign in',
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
        ));
  }
}
