import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../users/onboarding.dart';


class SplashScreenOnBoarding extends StatefulWidget {
  const SplashScreenOnBoarding({super.key});

  @override
  State<SplashScreenOnBoarding> createState() => _SplashScreenOnBoardingState();
}

class _SplashScreenOnBoardingState extends State<SplashScreenOnBoarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (() {
      Get.offAll( OnBoardingPage());
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
