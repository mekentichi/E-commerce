import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/orders/accepted_controller.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/static/color.dart';
import '../../../model/orders_model.dart';


class AcceptedOrdersAdmin extends StatelessWidget {
  const AcceptedOrdersAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedOrdersController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Accepted Orders'),
          backgroundColor: AppColor.secondycolor,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<AcceptedOrdersController>(
              builder: (controller) => HandlingDataView(statusrequest: controller.statusrequest, widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) =>
                      OrdersPendingList(listdata: controller.data[index])),)
            )));
  }
}

class OrdersPendingList extends GetView<AcceptedOrdersController> {
  final OrdersModel listdata;
  const OrdersPendingList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
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
                if(listdata.ordersstatus! =='0')MaterialButton(
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
