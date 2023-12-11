import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/home_data.dart';
import '../../model/items_model.dart';
import '../../services/services.dart';
import '../../views/users/detailsitems.dart';
import '../../views/users/items.dart';
import '../../views/users/itemsdetails.dart';

abstract class HomePageController extends SearchDataController {
  initialData();
  getData();
  goToItems(List categories, int selectedcat, String categoriesid);
  goToItemss(ItemsModel itemsModel);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();
  String? username;
  String? id;
  HomaPageData homaPageData = HomaPageData(Get.find());
  List categories = [];
  List items = [];
  List settings = [];
  String titlehome = "";
  String bodyhome = "";
  String deliverytime = "";

  @override
  initialData() {
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getData();
    refresh();
    super.onInit();
  }

  @override
  getData() async {
    statusrequest = StatusRequest.loading;

    var response = await homaPageData.getData();
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['itemsview']);
        settings.addAll(response['settings']);
        titlehome = settings[0]['settings_title'];
        bodyhome = settings[0]['settings_body'];
        deliverytime = settings[0]['settings_deliverytime'];
        myServices.sharedPreferences.setString("deliverytime", deliverytime);
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  @override
  goToItems(categories, selectedcat, categoriesid) {
    Get.to(Items(), arguments: {
      "categories": categories,
      "selectedcat": selectedcat,
      "catid": categoriesid
    });
  }

  @override
  goToItemss(itemsModel) {
    Get.to(Items(), arguments: {
      "itemsmodel": itemsModel,
    });
  }

  goToItemsDetails(itemsModel) {
    Get.off(ItemsDetails(), arguments: {
      "itemsmodel": itemsModel,
    });
  }
}

class SearchDataController extends GetxController {
  StatusRequest? statusrequest;
  HomaPageData homaPageData = HomaPageData(Get.find());

  TextEditingController? search;
  bool issearch = false;
  List<ItemsModel> searchdata = [];

  isCheckSearch(val) {
    if (val == "") {
      issearch = false;
    }
    update();
  }

  searchitemss() async {
    searchitems();
    issearch = true;
    update();
  }

  searchitems() async {
    statusrequest = StatusRequest.loading;

    var response = await homaPageData.searchData(search!.text);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        searchdata.clear();
        List responsedata = response['data'];

        searchdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }

    update();
  }

  goToItemsDetailss(itemsModel) {
    Get.to(ItemsDetailsView(), arguments: {
      "itemsmodel": itemsModel,
    });
  }
  
}
