import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/itemsdetaills_controller.dart';

class PriceAndCount extends GetView<ItemsDetailsControllerImp> {
  final void Function()? onadd;
  final void Function()? ondelete;

  final String count;

  const PriceAndCount({
    super.key,
    required this.onadd,
    required this.ondelete,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(style: BorderStyle.solid)),
              child: IconButton(onPressed: ondelete,icon: Icon(Icons.remove) )),
          const SizedBox(width: 30),
          Text(count),
          const SizedBox(width: 30),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(style: BorderStyle.solid)),
              child: IconButton(onPressed: onadd, icon: Icon(Icons.add))),
        ],
      ),
    );
  }
}
