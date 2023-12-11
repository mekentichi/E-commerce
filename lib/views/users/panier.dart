import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/users/panier_controller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/static/color.dart';
import '../../model/mypanier_model.dart';
import '../../widget/panier/bottonnavigationbar.dart';
import '../../widget/panier/customcardmypanier.dart';


class MyPanier extends StatelessWidget {
  const MyPanier({super.key});

  @override
  Widget build(BuildContext context) {
    PanierController panierController = Get.put(PanierController());
    final MyPanierModel myPanierModel;

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Panier'),
          backgroundColor: AppColor.secondycolor,
        ),
        bottomNavigationBar: GetBuilder<PanierController>(
          builder: (controller) => ButtonNavigationBar(
            onApplyCoupon: () {
              controller.checkCoupon();
              controller.totalPrice();
            },
            controllercoupon: panierController.controllercoupon,
            count: '${panierController.discountcoupon} %',
            price: '${panierController.totalprice} DA',
            total: '${panierController.totalPrice()} DA',
            shipping: '0',
            onTap: () {
              controller.goToPageCheckOut();

              // Get.to(CheckOut());
            },
          ),
        ),
        body: SafeArea(
          child: GetBuilder<PanierController>(
            builder: (controller) => controller.statusrequest ==
                    StatusRequest.loading
                ? Center(
                    child: Lottie.asset("lottie/nodata.json"),
                  )
                : ListView(
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          padding: const EdgeInsets.only(top: 5),
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.secondycolor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "you have ${panierController.totalcount} article ",
                            style: const TextStyle(fontSize: 25, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            //controller.isfavorite[controller.data[i]['items_id']] =
                            //controller.data[i]['favorite'];
                            return CustomCardMyPanier(
                              myPanierModel: controller.data[index],
                              onadd: () async {
                                await panierController.addPanier(
                                    panierController.data[index].itemsId!);
                                panierController.refreshData();
                              },
                              onremove: () async {
                                await panierController.removePanier(
                                    panierController.data[index].itemsId!);
                                panierController.refreshData();
                              },
                            );
                          }),
                      const SizedBox(height: 3),
                      // Padding(
                      //   padding: const EdgeInsets.all(5.0),
                      //   child: Card(
                      //     child: Container(
                      //       width: double.infinity,
                      //       height: 70,
                      //       child: Row(
                      //         children: [
                      //           const Expanded(flex: 3, child: Text("Total:")),
                      //           Expanded(
                      //             flex: 4,
                      //             child: Text(
                      //               "${controller.totalprice} Da",
                      //               style: TextStyle(fontSize: 30),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
          ),
        ));
  }
}
