import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/onbording.dart';
import '../../data/static/dataonboarding.dart';

class SliderOnBoarding extends StatelessWidget {
  const SliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller) {
      return PageView.builder(
          controller: controller.pagecontroller,
          onPageChanged: (value) {
            controller.onPageChanged(value);
          },
          itemCount: onboardinglist.length,
          itemBuilder: ((context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(onboardinglist[index].title!,
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline1),
                Image.asset(onboardinglist[index].images!),
                Text(onboardinglist[index].body!),
              ],
            );
          }));
    });
  }
}
