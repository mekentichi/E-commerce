
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/admin/orders/accepted_dara.dart';
import '../../../model/orders_model.dart';
import '../../../services/services.dart';




class AcceptedOrdersController extends GetxController {
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];

  AcceptedOrdersData acceptedOrdersData = AcceptedOrdersData(Get.find());

  StatusRequest? statusrequest;
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
    var response = await acceptedOrdersData.getData();
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

  

  

  @override
  void onInit() {
    // TODO: implement onInit
    getOrders();
    super.onInit();
  }

 
}
