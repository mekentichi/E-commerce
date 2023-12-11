import 'package:Queen_Beauty/views/users/panier.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/users/itemsdetaills_controller.dart';
import '../../controller/users/panier_controller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/static/color.dart';
import '../../linkapi/linkapi.dart';
import '../../widget/itemsdetaills/price_and_count.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controllerr =
        Get.put(ItemsDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                //margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: GetBuilder<ItemsDetailsControllerImp>(
                  builder: (controller) => PriceAndCount(
                    count: '${controller.counteritems}',
                    onadd: () {
                      controller.add();
                    },
                    ondelete: () {
                      controller.remove();
                      print('sucess');
                    },
                  ),
                )),
            const SizedBox(height: 10),
            GetBuilder<PanierController>(
              builder: (controller) =>
                  controller.statusrequest == StatusRequest.loading
                      ? Center(
                          child: Lottie.asset("lottie/loading.json"),
                        )
                      : Container(
                          width: double.infinity - 20,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColor.primarycolor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              controller.refreshData();

                              Get.to(MyPanier());
                            },
                            child: const Text('Go To Cart'),
                          )),
            )
          ],
        ),
        body: SafeArea(
          child: GetBuilder<ItemsDetailsControllerImp>(
            builder: (controller) => controller.statusrequest ==
                    StatusRequest.loading
                ? Center(
                    child: Lottie.asset("lottie/loading.json"),
                  )
                : Container(
                    child: ListView(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  color: AppColor.primarycolor,
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(20))),
                            ),
                            Positioned(
                                top: 75,
                                left: Get.width / 8,
                                right: Get.width / 8,
                                child: Hero(
                                  tag: controller.itemsModel.itemsId!,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${LinkApi.imagesitems}/${controller.itemsModel.itemsImage}",
                                    height: 200,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Positioned(
                              top: 280,
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${controller.itemsModel.itemsName}',
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 8),
                                          Text(
                                              '${controller.itemsModel.itemsDescreption}',
                                              maxLines: 3,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // margin: EdgeInsets.only(
                                      //     bottom: 32, right: 10),
                                      child: Text(
                                          textAlign: TextAlign.start,
                                          '${controller.itemsModel.itemsPriceDiscount} DA',
                                          style: TextStyle(
                                              color: AppColor.secondycolor,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
          ),
        ));
  }
}
