import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/offers_data.dart';
import '../../model/items_model.dart';
import 'home_controller.dart';

class OffersController extends SearchDataController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  StatusRequest? statusrequest;
  getItems() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await offersData.getData();
   
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
     
      if (response['status'] == "success") {
        print(statusrequest);
        List responsedata = response['data'];
        // data.addAll(response['data']);
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
        
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    search = TextEditingController();
    getItems();
    super.onInit();
  }
}
