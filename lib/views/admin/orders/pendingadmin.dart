import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/orders/approve_controller.dart';
import '../../../controller/admin/orders/pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/static/color.dart';
import '../../../model/orders_model.dart';

class PendingOrdersAdmin extends StatelessWidget {
  const PendingOrdersAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersAdminController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pending Orders'),
          backgroundColor: AppColor.secondycolor,
        ),
        body: GetBuilder<PendingOrdersAdminController>(
            builder: (controller) => HandlingDataView(
                  statusrequest: controller.statusrequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              controller
                                  .goToPageDetails(controller.data[index]);
                            },
                            child: OrdersPendingList(
                                onpress: ()async {
                                 await controller.getApprove(
                                      controller.data[index].ordersUserid,
                                      controller.data[index].ordersId);
                                },
                                listdata: controller.data[index]))),
                  ),
                )));
  }
}

class OrdersPendingList extends GetView<PendingOrdersAdminController> {
  final void Function()? onpress;
  final OrdersModel listdata;
  const OrdersPendingList(
      {super.key, required this.listdata, required this.onpress});

  @override
  Widget build(BuildContext context) {
    // ApprovedOrdersController c=Get.put(ApprovedOrdersController());

    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Number : ${listdata.ordersId}',
              style: TextStyle(
                  color: AppColor.primarycolor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text("Type Delivrey : ${listdata.ordersTypedelivery}"),
            Text("Price Delivrey : ${listdata.ordersPricedelivery} \$"),
            Text("Price Order : ${listdata.ordersPrice} \$"),
            Text("Payment Methode : ${listdata.ordersPaymentmethode}"),
            Text(
                "Orders Status : ${controller.printOrdersStatus(listdata.ordersstatus!)}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price : ${listdata.ordersTotalprice} \$",
                  style: TextStyle(
                      color: AppColor.secondycolor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                if (listdata.ordersstatus! == '0')
                  MaterialButton(
                    onPressed: onpress,
                    // ()async {
                    //   await  controller.getApprove(listdata.ordersUserid,listdata.ordersId);
                    // },
                    child: Container(
                        padding: const EdgeInsets.all(7),
                        color: AppColor.secondycolor,
                        child: const Text('Accepted')),
                  ),
                MaterialButton(
                  onPressed: () {
                    // controller.removePanier(listdata.ordersId!);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(7),
                      color: AppColor.secondycolor,
                      child: const Text('Delete')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
