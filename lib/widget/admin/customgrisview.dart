import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final void Function()? onTap;
  final String imagename;
  final String text;

  const CustomGridView(
      {super.key, this.onTap, required this.imagename, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagename,
              width: 100,
              height: 80,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
