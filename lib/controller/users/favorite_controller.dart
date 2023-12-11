import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/favorite_data.dart';
import '../../services/services.dart';

class FavoriteController extends GetxController {
  Map isfavorite = {};
  MyServices myServices = Get.find();
  FavoriteData favData = FavoriteData(Get.find());
  StatusRequest? statusrequest;

  List data = [];

  setFavorite(id, val) {
    isfavorite[id] = val;
    update();
  }

  addFavorite(itemsid) async {
    //data.clear();
    statusrequest = StatusRequest.loading;
    var response = await favData.addData(
        itemsid, myServices.sharedPreferences.getString("id"));
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
  }

  removeFavorite(itemsid) async {
    //data.clear();
    statusrequest = StatusRequest.loading;
    var response = await favData.removeData(
        itemsid, myServices.sharedPreferences.getString("id"));
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
  }

  
}
