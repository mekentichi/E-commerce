import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../linkapi/linkapi.dart';
import '../../controller/users/panier_controller.dart';
import '../../model/mypanier_model.dart';

class CustomCardMyPanier extends GetView<PanierController> {
  //final ItemsModel itemsModel;
  final MyPanierModel myPanierModel;
  final void Function()? onadd;
  final void Function()? onremove;


  //final bool active;
  const CustomCardMyPanier( {super.key, required this.myPanierModel,required this.onadd,required this.onremove});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItemsDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      controller.removePanier(myPanierModel.panierId!);
                    },
                    icon: const Icon(Icons.remove_circle_outline)),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Hero(
                    tag: myPanierModel.itemsId!,
                    //tag: myFavoriteModel.favoriteUsersid!,

                    child: CachedNetworkImage(
                        imageUrl:
                            "${LinkApi.imagesitems}/${myPanierModel.itemsImage}",
                        height: 120),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${myPanierModel.itemsName}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${myPanierModel.itemsDescreption}',
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${myPanierModel.itemsprice} Da',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 50,
                            child: IconButton(
                                onPressed: onremove, icon: const Icon(Icons.remove))),
                        Text("${myPanierModel.countitems}"),
                        IconButton(onPressed: onadd, icon: const Icon(Icons.add)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
