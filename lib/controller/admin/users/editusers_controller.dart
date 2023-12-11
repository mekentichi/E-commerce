
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/admin/users_data.dart';
import '../../../model/orders_model.dart';
import '../../../model/usersview_model.dart';
import '../../../services/services.dart';
import '../../../views/admin/users/view.dart';

class EditUsersController extends GetxController {
  MyServices myServices = Get.find();
  List<UsersViewModel> data = [];

  UsersData usersData = UsersData(Get.find());

  StatusRequest? statusrequest;
  UsersViewModel? usersViewModel;
  late TextEditingController usersetats;

  editUsers() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response =
        await usersData.editData(usersViewModel!.usersId!, usersetats.text);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        Get.off(UsersView());
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

  @override
  void onInit() {
    usersViewModel = Get.arguments["usersViewModel"];
    usersetats = TextEditingController();
    usersetats.text = usersViewModel!.usersEtats!;
    // TODO: implement onInit
    // editUsers();
    super.onInit();
  }
}
