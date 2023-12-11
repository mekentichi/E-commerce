import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/items_controller.dart';
import '../../controller/users/panier_controller.dart';
import '../../model/items_model.dart';
import '../../model/mypanier_model.dart';

class AddToPanier extends GetView<ItemsControllerImp> {
  final MyPanierModel myPanierModel;
    final ItemsModel itemsModel;


  const AddToPanier( {super.key, required this.myPanierModel,required this.itemsModel});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<PanierController>(
        builder: (controller) => MaterialButton(
              onPressed: () {
                controller.addPanier(itemsModel.itemsId!);
              },
              child: const Text('Add To Cart'),
            ));
  }
}
