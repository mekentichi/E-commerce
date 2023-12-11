import 'package:Queen_Beauty/controller/users/home_controller.dart';
import 'package:Queen_Beauty/model/items_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../core/class/statusrequest.dart';
import '../../core/static/color.dart';
import '../../linkapi/linkapi.dart';
import '../../widget/categories/customlistcategorieshome.dart';
import '../../widget/customsearch.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemsModel itemsModel;

    Get.put(HomePageControllerImp());
    return Scaffold(
        body: GetBuilder<HomePageControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CustomSearch(
                mycontroller: controller.search!,
                onChanged: (val) {
                  controller.isCheckSearch(val);
                  controller.searchitemss();
                  controller.isCheckSearch(val);
                },
                onPressed: () {
                  controller.searchitemss();
                },
              ),
              const SizedBox(height: 15),
              controller.issearch == false
                  ? controller.statusrequest == StatusRequest.loading
                      ? Center(
                          child: Lottie.asset("lottie/loading.json"),
                        )
                      : Column(
                          children: [
                            Container(
                              child: Stack(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      //margin: const EdgeInsets.only(top: 20),
                                      height: 130,
                                      decoration: BoxDecoration(
                                          color: AppColor.primarycolor,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ListTile(
                                        title: Text(
                                          '${controller.titlehome}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '${controller.bodyhome}',
                                          style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                      top: -25,
                                      right: -25,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: AppColor.secondycolor,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Categories',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const ListCategoriesHome(),
                            const SizedBox(height: 20),
                            const Text(
                              'Best Selling',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 130,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 5,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.items.length,
                                  itemBuilder: (context, index) {
                                    return CustomBestseslling(
                                        itemsModel: ItemsModel.fromJson(
                                      controller.items[index],
                                    ));
                                  }),
                            ),
                          ],
                        )
                  : CustomSearchPage(
                      itemsModel: controller.searchdata,
                    ),
            ]),
      ),
    ));
  }
}

class CustomSearchPage extends GetView<HomePageControllerImp> {
  final List<ItemsModel> itemsModel;
  const CustomSearchPage({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemsModel.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.goToItemsDetails(itemsModel[i]);
            },
            child: Card(
              child: Row(
                children: [
                  Expanded(
                      child: CachedNetworkImage(
                          imageUrl:
                              "${LinkApi.imagesitems}/${itemsModel[i].itemsImage}")),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text('${itemsModel[i].itemsName}'),
                      subtitle: Column(
                        children: [
                          Text('${itemsModel[i].itemsDescreption}'),
                          Text('${itemsModel[i].itemsPrice} Da'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CustomBestseslling extends GetView<HomePageControllerImp> {
  final ItemsModel itemsModel;

  const CustomBestseslling({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetailss(itemsModel);
      },
      child: Column(
        children: [
          Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColor.secondycolor,
            ),
            child: CachedNetworkImage(
              imageUrl:
                  "${LinkApi.imagesitems}/${itemsModel.itemsImage}",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${itemsModel.itemsPrice}",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
