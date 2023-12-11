import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../admin/adminhome.dart';

class SplashScreenAdmin extends StatefulWidget {
  const SplashScreenAdmin({super.key});

  @override
  State<SplashScreenAdmin> createState() => _SplashScreenAdminState();
}

class _SplashScreenAdminState extends State<SplashScreenAdmin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (() {
      Get.offAll(AdminHome());
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
