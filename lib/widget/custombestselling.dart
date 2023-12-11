// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce/controller/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controller/items_controller.dart';
// import '../core/static/color.dart';
// import '../linkapi/linkapi.dart';
// import '../model/items_model.dart';

// class CustomBestseslling extends GetView<HomePageControllerImp> {
//   final ItemsModel itemsModel;
 

//   const CustomBestseslling({
//     super.key,
//     required this.itemsModel,
   
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//               onTap: () {
//                 controller.goToItemsDetailss(itemsModel);
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     height: 100,
//                     width: 120,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: AppColor.secondycolor,
//                     ),
//                     child: CachedNetworkImage(
//                       imageUrl:
//                           "${LinkApi.imagesitems}/${controller.items[index]['items_image']}",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     "${controller.items[index]['items_price']}",
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             );
//           }
    
    
  
// }
