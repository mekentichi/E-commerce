import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/orders.dart';
import '../../model/orders_model.dart';
import '../../services/services.dart';
import '../../views/admin/orders/details.dart';

class PendingOrdersController extends GetxController {
  OrdersData oredrsData = OrdersData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];
  late StatusRequest statusrequest;

  // ignore: non_constant_identifier_names
  String printOrdersStatus(String val) {
    if (val == '0') {
      return 'Await Approval';
    } else if (val == "1") {
      return 'Await Prepare';
    } else if (val == "2") {
      return 'On The Way ';
    } else {
      return 'Archive';
    }
  }

  getOrders() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();

    var response =
        await oredrsData.getData(myServices.sharedPreferences.getString("id"));

    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  removePanier(itemsid) async {
    statusrequest = StatusRequest.loading;
    update();

    var response = await oredrsData.deleteData(itemsid);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        refreshOrders();
        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
        Get.snackbar('warning', 'impossible to remove this orders');
      }
    } else {
      return statusrequest;
    }
    update();
  }


  archiveOrders() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();

    var response =
        await oredrsData.archiveData(myServices.sharedPreferences.getString("id"));

    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  refreshOrders() {
    getOrders();
  }
  goToPageDetails(OrdersModel ordersModel) {
    Get.to(DetailsOrdersView(),arguments: {
      "ordersModel":ordersModel
    });}

  @override
  void onInit() {
    // TODO: implement onInit
    getOrders();
    super.onInit();
  }
  
}
