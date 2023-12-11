import 'package:flutter/material.dart';
import '../../controller/users/onbording.dart';
import 'package:get/get.dart';
import '../../widget/onboarding/custombutton.dart';
import '../../widget/onboarding/customcontroller.dart';
import '../../widget/onboarding/customslideronboarding.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: SliderOnBoarding(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: const [
                  ControllerSlider(),
                ],
              )),
          const ButtonOn(),
        ],
      ),
    ));
  }
}
