import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/admin/notification_controller.dart';
import '../controller/users/favorite_controller.dart';
import '../controller/users/myfavorite_controller.dart';
import '../controller/users/notifcation_controller.dart';
import '../core/static/color.dart';
import '../views/users/myfavorite.dart';
import '../views/users/notification.dart';
import 'package:badges/badges.dart' as badges;

class CustomSearch extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? mycontroller;
  final void Function()? onPressed;
  const CustomSearch(
      {super.key,
      required this.onChanged,
      required this.mycontroller,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    FavoriteController controller = Get.put(FavoriteController());
    MyFavoriteController myFavoriteController = Get.put(MyFavoriteController());
    NotificationController c = Get.put(NotificationController());

    return Container(
      height: 55,
      child: Row(
        children: [
          // Container(
          //     margin: const EdgeInsets.all(10), child: const Icon(Icons.menu)),
          Expanded(
              child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.search)), //const Icon(Icons.search),
                hintText: "Rechercher ...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
          )),
          // Container(
          //     margin: const EdgeInsets.all(10),
          //     child: const Icon(Icons.notifications)),
          Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(style: BorderStyle.solid)),
              margin: const EdgeInsets.only(left: 10),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.only(bottom: 10),
                child: badges.Badge(
                  showBadge: c.count == "0" ? false : true,
                  position: badges.BadgePosition.custom(top: 6, end: 5),
                  badgeContent: c.count == 0
                      ? null
                      : Text(
                          "${c.count}",
                          style: TextStyle(color: Colors.white),
                        ),
                  child: IconButton(
                    iconSize: 40,
                    onPressed: () {
                      // myFavoriteController.reseatData();
                      Get.to(const NotificationView());
                      c.updatedata();
                      c.count = "0";
                    },
                    icon: Icon(Icons.notifications_none_outlined,
                        color: AppColor.secondycolor // Color(0xFFDD7A83),
                        ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
