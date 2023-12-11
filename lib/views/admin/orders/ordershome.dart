import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/orders/ordershome_controller.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../widget/custombuttonbarimp.dart';

class OrdersHome extends StatelessWidget {
  const OrdersHome({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenHomeAdminControllerImp screenHomeController =
        Get.put(ScreenHomeAdminControllerImp());
    return GetBuilder<ScreenHomeAdminControllerImp>(
        builder: (controller) => HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: Scaffold(
              bottomNavigationBar: BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(screenHomeController.listbuttonbarr.length,
                        (index) {
                      int i = index > 2 ? index - 1 : index;
                      return CustomButtonBarImp(
                        onPressed: () {
                          screenHomeController.changePage(i);
                        },
                        iconData: screenHomeController.listicon[i],
                        text: screenHomeController.listbuttonbarr[i],
                        active: screenHomeController.currentPage == i
                            ? true
                            : false,
                      );
                    })
                  ],
                ),
              ),
              body: screenHomeController.listPage
                  .elementAt(screenHomeController.currentPage),
            )));
  }
}
