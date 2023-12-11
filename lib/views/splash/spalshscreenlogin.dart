
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login.dart';


class SplashScreenLogin extends StatefulWidget {
  const SplashScreenLogin({super.key});

  @override
  State<SplashScreenLogin> createState() => _SplashScreenLoginState();
}

class _SplashScreenLoginState extends State<SplashScreenLogin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (() {
      Get.offAll(Login());
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: "logo",
            child: Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  "images/logo.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
