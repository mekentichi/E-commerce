import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/admin/orders/approve_data.dart';
import '../../../model/orders_model.dart';
import '../../../services/services.dart';
import '../../../views/admin/orders/ordershome.dart';

class ApprovedOrdersController extends GetxController {
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];

  ApproveOrdersData approveOrdersData = ApproveOrdersData(Get.find());

  StatusRequest? statusrequest;
  OrdersModel? ordersModel;


  // String printOrdersStatus(String val) {
  //   if (val == '0') {
  //     return 'Await Approval';
  //   } else if (val == "1") {
  //     return 'Await Prepare';
  //   } else if (val == "2") {
  //     return 'On The Way ';
  //   } else {
  //     return 'Archive';
  //   }
  // }

  getApprove(String usersid,String ordersid) async {
    // data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await approveOrdersData.approveddata(
        ordersModel!.ordersUserid!, ordersModel!.ordersId!);
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
    // getApprove();
    super.onInit();
  }
}
