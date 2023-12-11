import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../controller/users/notifcation_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/static/color.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      body: Container(
          child: GetBuilder<NotificationController>(
              builder: (controller) => HandlingDataView(
                    statusrequest: controller.statusrequest,
                    widget: Container(
                      margin: const EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          Center(
                              child: Text(
                            "Notification",
                            style: TextStyle(
                                color: AppColor.secondycolor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                          const SizedBox(height: 10),
                          ...List.generate(
                              controller.data.length,
                              (index) => Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Card(
                                        child: Stack(
                                      children: [
                                        ListTile(
                                          title: Text(
                                              "${controller.data[index]["notification_title"]}"),
                                          subtitle: Text(
                                              "${controller.data[index]["notification_body"]}"),
                                        ),
                                        Positioned(
                                            top: 18,
                                            right: 10,
                                            child: Text(
                                              Jiffy.parse(controller.data[index]
                                                      ["notification_datetime"])
                                                  .fromNow(),
                                              style: TextStyle(
                                                  color: AppColor.secondycolor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    )),
                                  ))
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
