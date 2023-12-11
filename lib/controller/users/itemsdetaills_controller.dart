
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/panier_data.dart';
import '../../model/items_model.dart';
import '../../model/mypanier_model.dart';
import '../../services/services.dart';

abstract class ItemsDetailsController extends GetxController {
  initialData();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  // PanierController panierController = Get.put(PanierController());
  late ItemsModel itemsModel;
  PanierData panierData = PanierData(Get.find());
    MyServices myServices = Get.find();
  List<MyPanierModel> data = [];



  StatusRequest? statusrequest;
  int counteritems = 0;

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  initialData() async {
    statusrequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    counteritems = await counterPanier(itemsModel.itemsId);
    statusrequest = StatusRequest.success;
    update();
  }

  add() {
    addPanier(itemsModel.itemsId);
    counteritems++;
    update();
  }

  remove() {
    if (counteritems > 0) {
      removePanier(itemsModel.itemsId);
      counteritems--;
    }
    update();

  }

  addPanier(itemsid) async {
    //data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response = await panierData.addData(
        itemsid, myServices.sharedPreferences.getString("id"));
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  removePanier(itemsid) async {
    statusrequest = StatusRequest.loading;
    update();

    var response = await panierData.removeData(
        itemsid, myServices.sharedPreferences.getString("id"));
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }
  counterPanier(itemsid) async {
    data.clear();
    statusrequest = StatusRequest.loading;
    var response = await panierData.counterData(
        itemsid, myServices.sharedPreferences.getString("id"));
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        int counter = 0;
        counter = int.parse(response['data']);
        print(counter);
        return counter;
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }
}
