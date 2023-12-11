
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../data/remote/admin/categories_data.dart';
import '../../../model/categories_model.dart';
import '../../../services/services.dart';
import '../../../views/admin/adminhome.dart';
import '../../../views/admin/categories/edit.dart';

class CategoriesAdminController extends GetxController {
  MyServices myServices = Get.find();
  List<CategoriesModelStatic> data = [];

  CategoriesAdminData categoriesAdminData = CategoriesAdminData(Get.find());

  StatusRequest? statusrequest;

  getItems() async {
    data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await categoriesAdminData.getData();
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModelStatic.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  deleteCategories(String id, String imagename) {
    categoriesAdminData.deleteData({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  goToPageEdit(CategoriesModelStatic categoriesModel) {
    Get.to(CategoriesEdit(),arguments: {
      "categoriesModel":categoriesModel,
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
