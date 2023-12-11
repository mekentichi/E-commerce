import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/onbording.dart';
import '../../core/static/color.dart';

class ButtonOn extends StatelessWidget {
  const ButtonOn({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
          color:AppColor.secondycolor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
        margin: const EdgeInsets.only(bottom: 20),
        child: MaterialButton(
          onPressed: () {
            controller.next();
          },
          // ignore: deprecated_member_use
          child: const Text('next',
              style: TextStyle(fontSize: 25, color: Colors.white)),
        ),
      );
    });
  }
}
