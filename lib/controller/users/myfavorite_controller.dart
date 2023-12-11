import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/favorite_data.dart';
import '../../model/myfavorite_model.dart';
import '../../services/services.dart';
import 'home_controller.dart';

class MyFavoriteController extends SearchDataController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  List<MyFavoriteModel> data = [];
  FavoriteData favData = FavoriteData(Get.find());
  reseatData() {
    data.clear();
    myFavorite();
  }

  myFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await favData.getData(myServices.sharedPreferences.getString("id"));
    statusRequest = handilingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      return statusRequest;
    }
    update();
  }

  deleteFromFavorite(favoriteid) {
    //data.clear();
    //statusRequest = StatusRequest.loading;
    var response = favData.deleteData(favoriteid);
    //statusRequest = handilingData(response);
    //if (StatusRequest.success == statusRequest) {
    // if (response['status'] == "success") {
    //data.addAll(response['data']);
    //List responsedata = response['data'];
    data.removeWhere((element) => element.favoriteId == favoriteid);
    //} else {
    // statusRequest = StatusRequest.failure;
    //}
    //} else {
    //return statusRequest;
    //}
    update();
  }

  @override
  void onInit() {
    myFavorite();
    super.onInit();
  }
}
