import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/onbording.dart';
import '../../core/static/color.dart';
import '../../data/static/dataonboarding.dart';

class ControllerSlider extends StatelessWidget {
  const ControllerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ...List.generate(
          onboardinglist.length,
          (index) => AnimatedContainer(
            margin: const EdgeInsets.only(right: 10),
            width: controller.currentpage == index ? 20 : 6,
            height: 6,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: controller.currentpage == index
                    ?AppColor.secondycolor
                    : Colors.grey,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ]);
    });
  }
}
