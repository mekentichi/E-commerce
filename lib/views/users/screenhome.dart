import 'package:Queen_Beauty/views/users/panier.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/users/screenhome_controller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/static/color.dart';
import '../../widget/custombuttonbarimp.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScreenHomeControllerImp());
    return GetBuilder<ScreenHomeControllerImp>(
        builder: (controller) =>
            controller.statusrequest == StatusRequest.loading
                ? Center(
                    child: Lottie.asset("lottie/loading.json"),
                  )
                : Scaffold(
                    drawer: Drawer(),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerDocked,
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: AppColor.secondycolor,
                      onPressed: () {
                        Get.to(MyPanier());
                        // controller.changePage(4);
                      },
                      child: const Icon(Icons.shopping_basket_sharp),
                    ),
                    bottomNavigationBar: BottomAppBar(
                      child: Row(
                        children: [
                          ...List.generate(controller.listbuttonbarr.length + 1,
                              (index) {
                            int i = index > 2 ? index - 1 : index;
                            return index == 2
                                ? const Spacer()
                                : CustomButtonBarImp(
                                    onPressed: () {
                                      controller.changePage(i);
                                    },
                                    iconData: controller.listicon[i],
                                    text: controller.listbuttonbarr[i],
                                    active: controller.currentPage == i
                                        ? true
                                        : false,
                                  );
                          })
                        ],
                      ),
                    ),
                    body: controller.listPage.elementAt(controller.currentPage),
                  ));
  }
}
