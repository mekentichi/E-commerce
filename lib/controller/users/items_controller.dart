
import 'package:Queen_Beauty/controller/users/panier_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/items_data.dart';
import '../../model/items_model.dart';
import '../../services/services.dart';
import '../../views/users/itemsdetails.dart';
import 'home_controller.dart';

abstract class ItemsController extends SearchDataController {
  initialData();
  changecat(int val, var catval);
  getItems(String categorieid);
  goToItemsDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  ItemsDataView itemsData = ItemsDataView(Get.find());
  PanierController panierController = Get.put(PanierController());

 

  StatusRequest? statusrequest;

  List data = [];
  List categories = [];
  int? selecetedCat;
  late String idcat;
  MyServices myServices = Get.find();
  


  @override
  initialData() {
    categories = Get.arguments['categories'];
    selecetedCat = Get.arguments['selectedcat'];
    idcat = Get.arguments['catid'];
    
    
  

    getItems(idcat);
  }

  @override
  void onInit() {
    search = TextEditingController();

    initialData();

    super.onInit();
  }

  @override
  changecat(Val, catval) {
    selecetedCat = Val;
    idcat = catval;
    getItems(idcat);

    update();
  }

  @override
  getItems(categorieid) async {
    
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categorieid, myServices.sharedPreferences.getString("id"));
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  @override
  goToItemsDetails(itemsModel) {
    Get.to(ItemsDetails(), arguments: {
      "itemsmodel": itemsModel,
    });
  }
}
