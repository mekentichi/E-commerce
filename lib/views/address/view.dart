import 'package:flutter/material.dart';
import '../../core/static/color.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        floatingActionButton: IconButton(
            //color: AppColor.secondycolor,
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: AppColor.secondycolor,
            )),
        appBar: AppBar(
          backgroundColor: AppColor.secondycolor,
          title: const Text('Address'),
        ),
      ),
    );
  }
}
