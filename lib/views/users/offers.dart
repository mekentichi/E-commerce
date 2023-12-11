
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/users/favorite_controller.dart';
import '../../controller/users/offers_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../widget/customofferscard.dart';
import '../../widget/customsearch.dart';
import 'home.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  const SizedBox(height: 1),
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
                  const SizedBox(height: 5),
                  controller.issearch == false
                      ? HandlingDataView(
                          statusrequest: controller.statusrequest,
                          widget: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) => CustomOffersCard(
                              itemsModel: controller.data[index],
                            ),
                          ),
                        )
                      : CustomSearchPage(
                          itemsModel: controller.searchdata,
                        ),
                ],
              ),
            ));
  }
}
