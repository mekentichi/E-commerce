import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/users/favorite_controller.dart';
import '../../core/static/color.dart';
import '../../linkapi/linkapi.dart';
import '../../model/items_model.dart';
import '../controller/users/offers_controller.dart';

class CustomOffersCard extends GetView<OffersController> {
  final ItemsModel itemsModel;
  // final void Function()? onadd;
  //final bool active;
  const CustomOffersCard({super.key, required this.itemsModel, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Card(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              // fit: StackFit.loose,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  child: Hero(
                    tag: itemsModel.itemsId!,
                    child: Center(
                      child: CachedNetworkImage(
                          imageUrl:
                              "${LinkApi.imagesitems}/${itemsModel.itemsImage}",
                          height: 120),
                    ),
                  ),
                ),
                GetBuilder<FavoriteController>(
                    builder: (controller) => Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                if (controller.isfavorite[itemsModel.itemsId] ==
                                    "0") {
                                  controller.setFavorite(
                                      itemsModel.itemsId, "1");
                                  controller.addFavorite(itemsModel.itemsId);
                                } else {
                                  controller.setFavorite(
                                      itemsModel.itemsId, "0");
                                  controller.removeFavorite(itemsModel.itemsId);
                                }
                              },
                              icon: controller.isfavorite[itemsModel.itemsId] ==
                                      "0"
                                  ? const Icon(Icons.favorite_border_outlined)
                                  : const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )),
                        )),
                GetBuilder<OffersController>(
                    builder: (controller) => Positioned(
                          bottom: 0,
                          right: 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.secondycolor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                                color: Colors.white,
                                // onPressed: onadd,
                                onPressed: (){},
                                icon: const Icon(Icons.add)),
                          ),
                        )),
                if (itemsModel.itemsDiscount != '0')
                  Positioned(
                    top: 7,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 20, vertical: 7),
                      decoration: BoxDecoration(
                        color: AppColor.secondycolor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        '-${itemsModel.itemsDiscount}%',
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
            Text(
              '${itemsModel.itemsName}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '${itemsModel.itemsDescreption}',
              textAlign: TextAlign.center,
            ),
            Text(
              '${itemsModel.itemsPrice} Da',
              style: const TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
