
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/admin/items_data.dart';
import '../../../model/items_model.dart';
import '../../../services/services.dart';
import '../../../views/admin/adminhome.dart';
import '../../../views/admin/items/edit.dart';

class ItemsAdminController extends GetxController {
  MyServices myServices = Get.find();
  List<ItemsModel> data = [];

  ItemsAdminData itemsAdminData = ItemsAdminData(Get.find());

  StatusRequest? statusrequest;

  getItems() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await itemsAdminData.getData();
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  deleteItems(String id, String imagename) {
    itemsAdminData.deleteData({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goToPageEdit(ItemsModel itemsModel) {
    Get.to(ItemsEdit(),arguments: {
      "itemsModel":itemsModel
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getItems();
    super.onInit();
  }

  myBack() {
    Get.offAll(AdminHome());
    return Future.value(false);
  }
}
