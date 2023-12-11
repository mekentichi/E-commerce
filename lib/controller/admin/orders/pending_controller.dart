import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/admin/orders/approve_data.dart';
import '../../../data/remote/admin/orders/details_data.dart';
import '../../../data/remote/admin/orders/pending_data.dart';
import '../../../model/orders_model.dart';
import '../../../model/ordersdetails_model.dart';
import '../../../services/services.dart';
import '../../../views/admin/orders/details.dart';
import '../../../views/admin/orders/ordershome.dart';

class PendingOrdersAdminController extends GetxController {
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];

  PendingOrdersData pendingOrdersData = PendingOrdersData(Get.find());

  StatusRequest? statusrequest;
  ApproveOrdersData approveOrdersData = ApproveOrdersData(Get.find());
  OrdersModel? ordersModel;

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
    var response = await pendingOrdersData.getData();
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
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

  getApprove(usersid,ordersid) async {
    // data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await approveOrdersData.approveddata(
        usersid, ordersid);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        Get.off(OrdersHome());
        // data.addAll(response['data']);
        // List listdata = response['data'];
        // data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
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
    getOrders();

    super.onInit();
  }

  
  goToPageDetails(OrdersModel ordersModel) {
    Get.to(DetailsOrdersView(),arguments: {
      "ordersModel":ordersModel
    });
  }
}
