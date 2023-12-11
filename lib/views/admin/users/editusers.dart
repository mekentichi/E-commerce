
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/users/editusers_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/static/color.dart';
import '../../../widget/auth/customtextformfield.dart';

class EditUsers extends StatelessWidget {
  const EditUsers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditUsersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Users'),
        backgroundColor: AppColor.secondycolor,
      ),
      body: GetBuilder<EditUsersController>(
          builder: (controller) => HandlingDataView(statusrequest: controller.statusrequest, widget: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${controller.usersViewModel!.usersEmail}",
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomFormField(
                        hint: "Users_Etats",
                        prefix: null,
                        label: null,
                        obscureText: false,
                        mycontroller: controller.usersetats,
                        valid: null),
                    const SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      onPressed: () {
                        controller.editUsers();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.secondycolor,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 10),
                        child: const Text('Confirme'),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
