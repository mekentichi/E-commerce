import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/items/view_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/static/color.dart';
import '../../../linkapi/linkapi.dart';
import 'add.dart';

class ItemsHomeView extends StatelessWidget {
  const ItemsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAdminController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items Home'),
        backgroundColor: AppColor.secondycolor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.secondycolor,
        onPressed: () {
          Get.to(ItemsAdd());
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ItemsAdminController>(
        builder: (controller) => HandlingDataView(
          statusrequest: controller.statusrequest,
          widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      controller
                                        .goToPageEdit(controller.data[index]);
                    },
                    child: Card(
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 130,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${LinkApi.imagesitems}/${controller.data[index].itemsImage}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                  flex: 4,
                                  child: ListTile(
                                    title: Text(
                                      "${controller.data[index].itemsName}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.data[index].itemsDescreption}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "${controller.data[index].itemsPrice} Da",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
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
                                          controller.deleteItems(
                                              "${controller.data[index].itemsId}",
                                              "${controller.data[index].itemsImage}");
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
