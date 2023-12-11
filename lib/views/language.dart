import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/localisation/changelanguage.dart';

class Language extends GetView<localLanguage> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            Text(
              '01'.tr,
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline1,
            ),
            MaterialButton(
                onPressed: () {
                  controller.changeLang('fr');
                },
                child: Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: const Text('FR'))),
            MaterialButton(
                onPressed: () {
                  controller.changeLang('ar');
                },
                child: Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: const Text('AR'))),
          ],
        ),
      ),
    );
  }
}
