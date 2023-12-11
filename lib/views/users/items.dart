import 'package:Queen_Beauty/views/users/home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/favorite_controller.dart';
import '../../controller/users/home_controller.dart';
import '../../controller/users/items_controller.dart';
import '../../controller/users/panier_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../model/items_model.dart';
import '../../widget/items/customitemscategories.dart';
import '../../widget/customsearch.dart';
import '../../widget/items/customnv.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerfav = Get.put(FavoriteController());
    PanierController panierController = Get.put(PanierController());
    HomePageControllerImp controller = Get.put(HomePageControllerImp());


    return Scaffold(
        body:GetBuilder<ItemsControllerImp>(
        builder: (controller) =>  Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child:  ListView(
          children: [
            // CustomSearch(),
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
            const ListItemsCategories(),
           HandlingDataView(
              statusrequest: controller.statusrequest,
              widget:!controller.issearch? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.635),
                  itemBuilder: (context, i) {
                    controllerfav.isfavorite[controller.data[i]['items_id']] =
                        controller.data[i]['favorite'];
                    return CustomNv(
                      //active: false,
                      itemsModel: ItemsModel.fromJson(controller.data[i]),
                      onadd: () {
                        panierController
                            .addPanier(controller.data[i]['items_id']);
                        
                      },
                    );
                  }):CustomSearchPage(
                  itemsModel: controller.searchdata,
                ),
            ),
          ],
        ),
      
    )));
  }
}
