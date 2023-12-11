

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:Queen_Beauty/controller/users/itemsdetaills_controller.dart';
import 'package:Queen_Beauty/controller/users/panier_controller.dart';
import 'package:Queen_Beauty/core/class/statusrequest.dart';
import 'package:Queen_Beauty/core/static/color.dart';
import 'package:Queen_Beauty/linkapi/linkapi.dart';
import 'package:Queen_Beauty/views/users/panier.dart';
import 'package:Queen_Beauty/widget/itemsdetaills/price_and_count.dart';

class ItemsDetailsView extends StatelessWidget {
  const ItemsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controller = Get.put(ItemsDetailsControllerImp());

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ItemsDetailsControllerImp>(
          builder: (controller) =>
              controller.statusrequest == StatusRequest.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomScrollView(
                      slivers: [
                        _buildSliverAppBar(controller),
                        _buildSliverContent(controller),
                      ],
                    ),
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(ItemsDetailsControllerImp controller) {
    return SliverAppBar(
      expandedHeight: 300,
      floating: false,
      pinned: true,
      backgroundColor: AppColor.secondycolor,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: controller.itemsModel.itemsId!,
          child: CachedNetworkImage(
            imageUrl:
                "${LinkApi.imagesitems}/${controller.itemsModel.itemsImage}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSliverContent(ItemsDetailsControllerImp controller) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              controller.itemsModel.itemsName!,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '${controller.itemsModel.itemsPriceDiscount} DA',
                    style: TextStyle(
                        color: AppColor.secondycolor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: PriceAndCount(
                    count: '${controller.counteritems}',
                    onadd: () => controller.add(),
                    ondelete: () => controller.remove(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '${controller.itemsModel.itemsDescreption}',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 100),
            InkWell(
              onTap: () => Get.to(MyPanier()),
              child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.all(10),
                  color: AppColor.secondycolor,
                  child: Center(
                      child: const Text(
                    'Aller au panier',
                    style: TextStyle(fontSize: 20),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
