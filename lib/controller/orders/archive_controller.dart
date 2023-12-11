import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/orders.dart';
import '../../model/orders_model.dart';
import '../../services/services.dart';

class ArchiveOrdersController extends GetxController{

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
    archiveOrders();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    archiveOrders();

    super.onInit();
  }
}