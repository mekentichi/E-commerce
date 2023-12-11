
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin/notification_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/function/validinput.dart';
import '../../core/static/color.dart';
import '../../widget/admin/customfromfield.dart';

class NotificationSend extends StatelessWidget {
  const NotificationSend({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationAdminController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
          backgroundColor: AppColor.secondycolor,
        ),
        body: GetBuilder<NotificationAdminController>(
            builder: (controller) => HandlingDataView(
                  statusrequest: controller.statusRequest,
                  widget: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CustomFormFieldCat(
                          hint: 'Title Notification',
                          label: null,
                          mycontroller: controller.title,
                          prefix: null,
                          obscureText: false,
                          valid: (String? val) {
                            return validInput(val!, 3, 30, 'name');
                          },
                        ),
                        SizedBox(height: 10),
                        CustomFormFieldCat(
                          hint: 'body Notification',
                          label: null,
                          mycontroller: controller.body,
                          prefix: null,
                          obscureText: false,
                          valid: (String? val) {
                            return validInput(val!, 3, 100, 'name');
                          },
                        ),
                        SizedBox(height: 10),
                        MaterialButton(
                          onPressed: () {
                            controller.sendNotify();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColor.secondycolor,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            child: const Text('Send'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
