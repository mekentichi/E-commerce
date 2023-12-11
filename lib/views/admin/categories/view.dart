import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/categories/view_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/static/color.dart';
import '../../../linkapi/linkapi.dart';
import 'add.dart';

class CategoriesHomeView extends StatelessWidget {
  const CategoriesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAdminController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories Home'),
        backgroundColor: AppColor.secondycolor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.secondycolor,
        onPressed: () {
          Get.to(CategoriesAdd());
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<CategoriesAdminController>(
        builder: (controller) => HandlingDataView(
          statusrequest: controller.statusrequest,
          widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      controller.goToPageEdit(controller.data[index]);
                    },
                    child: Card(
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 130,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${LinkApi.imagescategories}/${controller.data[index].categoriesImage}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "${controller.data[index].categoriesName}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        title: "warning",
                                        middleText: "Are you sure to delete",
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deleteCategories(
                                              "${controller.data[index].categoriesId}",
                                              "${controller.data[index].categoriesImage}");
                                          Get.back();
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.delete)),
                              ),
                            ],
                          ),
                        ),
                  ))),
        ),
      ),
    );
  }
}
