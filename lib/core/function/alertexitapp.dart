import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "alert Exit",
      content: const Text('if you hav exit to app'),
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text('confirm')),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('cancel')),
      ]);
  return Future.value(true);
}
