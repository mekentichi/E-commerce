import 'package:flutter/material.dart';

import '../../core/static/color.dart';

class CustominfoCheckOut extends StatelessWidget {
  final String title;
  const CustominfoCheckOut({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: AppColor.secondycolor,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
