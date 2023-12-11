import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/countnotification_data.dart';
import '../../data/remote/notification_data.dart';
import '../../data/remote/updatenotification_data.dart';
import '../../services/services.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  CountNotificationData countNotificationData =
      CountNotificationData(Get.find());
  UpdateNotificationData updateNotificationData =
      UpdateNotificationData(Get.find());

  MyServices myServices = Get.find();
  List data = [];
  var count="0";
  late StatusRequest statusrequest;

  getNotification() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();

    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);

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

  getCount() async {
    // count = null;
    statusrequest = StatusRequest.loading;
    update();

    var response = await countNotificationData
        .getData(myServices.sharedPreferences.getString("id")!);

    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        // count.add(response['data']);
        count = response['data'];
        print(count);
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  updatedata() async {
    

    statusrequest = StatusRequest.loading;
    update();

    var response = await updateNotificationData
        .getData(myServices.sharedPreferences.getString("id")!);

    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        // count.add(response['data']);
        // count = response['data'];
        print(count);
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
    getCount();
    getNotification();
    super.onInit();
  }
}
