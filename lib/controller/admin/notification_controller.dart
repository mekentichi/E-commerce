
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/admin/notification_data.dart';
import 'package:flutter/material.dart';

import '../../views/admin/adminhome.dart';

class NotificationAdminController extends GetxController {
  StatusRequest? statusRequest;
  NotificationData notificationData = NotificationData(Get.find());
  TextEditingController? title;
  TextEditingController? body;

  sendNotify() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData.sendData(title!.text, body!.text);
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAll(AdminHome());
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      return statusRequest;
    }
    update();
  }

  @override
  void onInit() {
    title = TextEditingController();
    body = TextEditingController();

    // TODO: implement onInit
    super.onInit();
  }
}
