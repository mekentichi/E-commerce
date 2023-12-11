import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/users/viewusers_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/static/color.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users View'),
          backgroundColor: AppColor.secondycolor,
        ),
        body: GetBuilder<UsersController>(
          builder: (controller) => HandlingDataView(statusrequest: controller.statusrequest, widget: Container(
            margin: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        controller.goToPageEdit(controller.data[index]);
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            "${controller.data[index].usersEmail}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "${controller.data[index].usersEtats}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
          ),)
        ));
  }
}
