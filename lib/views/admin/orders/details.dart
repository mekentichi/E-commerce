import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/orders/datails_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/static/color.dart';

class DetailsOrdersView extends StatelessWidget {
  const DetailsOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsOrdersAdminController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details Orders'),
          backgroundColor: AppColor.secondycolor,
        ),
        body: GetBuilder<DetailsOrdersAdminController>(
            builder: (controller) => HandlingDataView(
                  statusrequest: controller.statusrequest,
                  widget: Container(
                      margin: EdgeInsets.all(10),
                      child: ListView(children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    const TableRow(children: [
                                      Text(
                                        "Items",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "QTY",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    ...List.generate(
                                        controller.data.length,
                                        (index) => TableRow(children: [
                                              Text(
                                                  "${controller.data[index].itemsName}"),
                                              Text(
                                                  "${controller.data[index].countitems}"),
                                              Text(
                                                  "${controller.data[index].itemsPrice}"),
                                            ]))
                                  ],
                                ),
                                ...List.generate(
                                  controller.data.length,
                                  (index) => Center(
                                    child: Text(
                                      "${controller.data[index].itemsprice}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ])),
                )));
  }
}
