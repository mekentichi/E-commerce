import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/users/home.dart';
import '../../views/users/myfavorite.dart';
import '../../views/users/notification.dart';
import '../../views/users/offers.dart';
import '../../views/users/panier.dart';
import '../../views/users/setting.dart';
import 'package:badges/badges.dart';

abstract class ScreenHomeController extends GetxController {
  changePage(value);
}

class ScreenHomeControllerImp extends ScreenHomeController {
  List<Widget> listPage = [
    const HomePage(),
    const MyFavorite(),
    const OffersView(),
    const Setting(),
    const MyPanier(),
  ];
  List listbuttonbarr = ["home", "Favorite", "Discount", "setting"];
  List listicon = [
    Icons.home,
    Icons.favorite,
    Icons.discount,
    Icons.settings,
  ];
  int currentPage = 0;

  get statusrequest => null;
  @override
  changePage(value) {
    currentPage = value;
    update();
  }
}
