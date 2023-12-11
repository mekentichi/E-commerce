
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/admin/users_data.dart';
import '../../../model/orders_model.dart';
import '../../../model/usersview_model.dart';
import '../../../services/services.dart';
import '../../../views/admin/users/editusers.dart';




class UsersController extends GetxController {
  MyServices myServices = Get.find();
  List<UsersViewModel> data = [];

  UsersData usersData = UsersData(Get.find());

  StatusRequest? statusrequest;
  

  getUsers() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await usersData.getData();
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List listdata = response['data'];
        data.addAll(listdata.map((e) => UsersViewModel.fromJson(e)));
        
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }
  goToPageEdit(UsersViewModel usersViewModel) {
    Get.to(EditUsers(),arguments: {
      "usersViewModel":usersViewModel
    });
  }

  

  

  @override
  void onInit() {
    // TODO: implement onInit
    getUsers();
    super.onInit();
  }

 
}
