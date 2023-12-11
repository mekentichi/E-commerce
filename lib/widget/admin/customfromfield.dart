import 'package:flutter/material.dart';

import '../../core/static/color.dart';

class CustomFormFieldCat extends StatelessWidget {
  final String hint;
  final Widget? prefix;
  final Widget? label;
  final bool obscureText;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final TextInputType? type;
  const CustomFormFieldCat(
      {super.key,
      required this.hint,
      required this.prefix,
      required this.label,
      required this.obscureText,
      required this.mycontroller,
      required this.valid,
      this.type});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
       validator: valid,
      controller: mycontroller,
      // ignore: unnecessary_null_comparison
      obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: label,
          hintText: hint,
          suffixIcon: prefix,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:  BorderSide(
                color: AppColor.secondycolor,
              ))),
    );
  }
}
