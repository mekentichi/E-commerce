import 'package:Queen_Beauty/views/admin/users/view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/users/setting_controller.dart';
import '../../core/static/color.dart';
import '../../widget/admin/customgrisview.dart';

import 'categories/view.dart';
import 'items/view.dart';
import 'notificationview.dart';
import 'orders/ordershome.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Admin Home')),
          backgroundColor: AppColor.secondycolor,
        ),
        body: ListView(
          children: [
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 150),
              children: [
                CustomGridView(
                  onTap: () {
                    Get.to(UsersView());
                  },
                  imagename: 'images/users.jpg',
                  text: 'users',
                ),
                CustomGridView(
                  onTap: () {
                    Get.to(OrdersHome());
                  },
                  imagename: 'images/orders.png',
                  text: 'Orders',
                ),
                CustomGridView(
                  onTap: () {
                    Get.to(const ItemsHomeView());
                  },
                  imagename: 'images/products1.png',
                  text: 'Product',
                ),
                CustomGridView(
                  onTap: () {
                    Get.to(const CategoriesHomeView());
                  },
                  imagename: 'images/categories.jpg',
                  text: 'Categories',
                ),
                CustomGridView(
                  onTap: () {
                    Get.to(NotificationSend());
                  },
                  imagename: 'images/notification.png',
                  text: 'Notification',
                ),
                CustomGridView(
                  onTap: () {
                    controller.logOut();
                  },
                  imagename: 'images/report.png',
                  text: 'Report',
                ),
              ],
            ),
          ],
        ));
  }
}
