import 'package:flutter/material.dart';

import '../../core/static/color.dart';

class ChoosePaymentMethode extends StatelessWidget {
  final String title;
  final bool isActive;
  const ChoosePaymentMethode({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          color:isActive==true? AppColor.secondycolor: AppColor.primarycolor,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
