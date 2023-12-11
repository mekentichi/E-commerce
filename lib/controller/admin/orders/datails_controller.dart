
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/admin/orders/details_data.dart';
import '../../../model/orders_model.dart';
import '../../../model/ordersdetails_model.dart';
import '../../../services/services.dart';

class DetailsOrdersAdminController extends GetxController {
  MyServices myServices = Get.find();
  List<OrdersDetails> data = [];
  // String? ordersid;

  DetailsOrdersData detailsOrdersData = DetailsOrdersData(Get.find());

  StatusRequest? statusrequest;
  OrdersModel? ordersModel;

  detailsOrders() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await detailsOrdersData.getData(ordersModel!.ordersId!);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersDetails.fromJson(e)));
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
    ordersModel = Get.arguments["ordersModel"];

    // TODO: implement onInit
    detailsOrders();
    super.onInit();
  }
}
