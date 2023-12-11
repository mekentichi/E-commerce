import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../linkapi/linkapi.dart';
import '../controller/users/myfavorite_controller.dart';
import '../model/myfavorite_model.dart';

class CustomCardMyFavorite extends GetView<MyFavoriteController> {
  //final ItemsModel itemsModel;
  final MyFavoriteModel myFavoriteModel;

  //final bool active;
  const CustomCardMyFavorite({super.key, required this.myFavoriteModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItemsDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Hero(
                  tag: myFavoriteModel.itemsId!,
                  //tag: myFavoriteModel.favoriteUsersid!,

                  child: CachedNetworkImage(
                      imageUrl:
                          "${LinkApi.imagesitems}/${myFavoriteModel.itemsImage}",
                      height: 120),
                ),
              ),
              Text(
                '${myFavoriteModel.itemsName}',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${myFavoriteModel.itemsDescreption}',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${myFavoriteModel.itemsPrice} Da',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        controller
                            .deleteFromFavorite(myFavoriteModel.favoriteId!);
                      },
                      icon: const Icon(Icons.delete,color: Colors.red,))
                  // GetBuilder<FavoriteController>(
                  //  builder: (controller) => IconButton(
                  //     onPressed: () {
                  //     if (controller.isfavorite[itemsModel.itemsId] ==
                  //        "0") {
                  //    controller.setFavorite(itemsModel.itemsId, "1");
                  //    controller.addFavorite(itemsModel.itemsId);
                  //  } else {
                  //    controller.setFavorite(itemsModel.itemsId, "0");
                  //   controller.removeFavorite(itemsModel.itemsId);
                  // }
                  // },
                  // icon: controller.isfavorite[itemsModel.itemsId] == "0"
                  //     ? Icon(Icons.favorite_border_outlined)
                  //    : Icon(
                  //        Icons.favorite,
                  //      color: Colors.red,
                  //)
                  // ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
