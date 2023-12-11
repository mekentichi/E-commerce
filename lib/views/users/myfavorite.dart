import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/users/myfavorite_controller.dart';
import '../../controller/users/home_controller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/static/color.dart';
import '../../widget/customcardmyfavorite.dart';


class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
   MyFavoriteController controller= Get.put(MyFavoriteController());
    Get.put(HomePageControllerImp());


    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite'),
          backgroundColor: AppColor.secondycolor,
      ),
        body: GetBuilder<MyFavoriteController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            // const CustomSearch(),
          //    CustomSearch(
          //   mycontroller: controller.search!,
          //   onChanged: (val) {
          //     homePageControllerImp.isCheckSearch(val);
          //     homePageControllerImp.searchitemss();
          //     homePageControllerImp.isCheckSearch(val);


          //   },
          //   onPressed: () {
          //     homePageControllerImp.searchitemss();
          //   },
          // ),
          
              
           controller.statusRequest ==
                  StatusRequest.loading
              ? Center(
                  child: Lottie.asset("lottie/loading.json"),
                )
              : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.635),
                itemBuilder: (context, index) {
                  //controller.isfavorite[controller.data[i]['items_id']] =
                  //controller.data[i]['favorite'];
                  return CustomCardMyFavorite(
                    myFavoriteModel: controller.data[index],
                  );
                }),//:CustomSearchPage(
                //   itemsModel: homePageControllerImp.searchdata,
                // ),
          ],
        ),
      ),
    ));
  }
}
