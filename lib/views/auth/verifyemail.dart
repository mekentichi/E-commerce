import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../widget/auth/custombody.dart';
import '../../../widget/auth/customlogo.dart';
import '../../../widget/auth/customtitle.dart';
import '../../controller/auth/verifyemail_controller.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyEmailControllerImp controller = Get.put(VerifyEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Verify Code',
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.headline2,
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
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
                  CustomBody(
                    body:
                        "Please Entre The Digit Code Send To / ${controller.email}",
                  ),
                  const SizedBox(height: 40),
                  OtpTextField(
                    borderRadius: BorderRadius.circular(15),
                    fieldWidth: 50,
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToSuccesSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  const SizedBox(height: 30),

                  //const SizedBox(height: 20),

                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      controller.reSend();
                    },
                    child: const Center(child: Text("resend verify code")),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
