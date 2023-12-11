import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../users/screenhome.dart';


class SplashScreenUser extends StatefulWidget {
  const SplashScreenUser({super.key});

  @override
  State<SplashScreenUser> createState() => _SplashScreenUserState();
}

class _SplashScreenUserState extends State<SplashScreenUser> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (() {
      Get.offAll(ScreenHome());
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
