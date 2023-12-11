import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      // ignore: deprecated_member_use
      style: Theme.of(context).textTheme.headline1,
      textAlign: TextAlign.center,
    );
  }
}
