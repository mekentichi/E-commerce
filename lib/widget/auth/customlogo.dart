import 'package:flutter/material.dart';

import '../../core/constant/image.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      CustomImage.logoAuth,
      fit: BoxFit.fill,
    );
  }
}
