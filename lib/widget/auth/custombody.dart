import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {
  final String body;
  const CustomBody({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      textAlign: TextAlign.center,
      style: const TextStyle(height: 1.5),
    );
  }
}
