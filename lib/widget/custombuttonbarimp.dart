import 'package:flutter/material.dart';
import '../core/static/color.dart';

class CustomButtonBarImp extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final String text;
  final bool active;
  const CustomButtonBarImp(
      {super.key,
      this.onPressed,
      required this.iconData,
      required this.text,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ?  AppColor.secondycolor : Colors.black,
          ),
          Text(
            text,
            style: TextStyle(
              color: active == true ? AppColor.secondycolor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
