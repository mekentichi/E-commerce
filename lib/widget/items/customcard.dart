import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/favorite_controller.dart';
import '../../controller/users/items_controller.dart';
import '../../core/static/color.dart';
import '../../linkapi/linkapi.dart';
import '../../model/items_model.dart';

class CustomCardItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final void Function()? onadd;
  //final bool active;
  const CustomCardItems(
      {super.key, required this.itemsModel, required this.onadd});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: 140,
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
                ),
                GetBuilder<FavoriteController>(
                    builder: (controller) => Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 0, bottom: 70, left: 0, right: 2),
                            width: 30,
                            child: IconButton(
                                onPressed: () {
                                  if (controller
                                          .isfavorite[itemsModel.itemsId] ==
                                      "0") {
                                    controller.setFavorite(
                                        itemsModel.itemsId, "1");
                                    controller.addFavorite(itemsModel.itemsId);
                                  } else {
                                    controller.setFavorite(
                                        itemsModel.itemsId, "0");
                                    controller
                                        .removeFavorite(itemsModel.itemsId);
                                  }
                                },
                                icon: controller
                                            .isfavorite[itemsModel.itemsId] ==
                                        "0"
                                    ? const Icon(Icons.favorite_border_outlined)
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )),
                          ),
                        )),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${itemsModel.itemsPrice} Da',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                GetBuilder<ItemsControllerImp>(
                    builder: (controller) => Container(
                          decoration: BoxDecoration(
                            color: AppColor.secondycolor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                              color: Colors.white,
                              onPressed: onadd,
                              icon: const Icon(Icons.add)),
                        ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
