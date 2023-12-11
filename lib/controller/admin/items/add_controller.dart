import 'dart:io';


import 'package:drop_down_list/model/selected_list_item.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../core/function/uploadfile.dart';
import '../../../data/remote/admin/categories_data.dart';
import '../../../data/remote/admin/items_data.dart';
import '../../../model/categories_model.dart';
import '../../../services/services.dart';
import '../../../views/admin/adminhome.dart';
import '../../../views/admin/items/view.dart';
import '../itemsadmin_controller.dart';

class ProductAddController extends GetxController {
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<SelectedListItem> dropdownlist = [];

  // late TextEditingController catid;
  late TextEditingController itemsdiscount;
  late TextEditingController itemsprice;
  // late TextEditingController itemsactive;
  late TextEditingController itemscount;
  late TextEditingController itemsdes;
  late TextEditingController itemsname;

  late TextEditingController dropdownname;
  late TextEditingController dropdownid;

  ItemsAdminData itemsAdminData = ItemsAdminData(Get.find());

  StatusRequest? statusrequest;
  File? file;
  chooseImage(type) async {
    if (type == "camera") {
      file = await uploadImage();
      update();
    } else if (type == "galery") {
      file = await uploadFile();
      update();
    }
  }

  addItems() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (file == null) return Get.snackbar('Warning', "Please Choose Image");
      Map data = {
        "itemsname": itemsname.text,
        "itemsdes": itemsdes.text,
        "itemscount": itemscount.text,
        // "itemsactive": itemsactive.text,
        "itemsprice": itemsprice.text,
        "itemsdiscount": itemsdiscount.text,
        "catid": dropdownid.text,
      };
      // data.clear();
      statusrequest = StatusRequest.loading;
      update();
      var response = await itemsAdminData.addData(data, file!);
      statusrequest = handilingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          Get.off(ItemsHomeView());
          ItemsAdminController c = Get.find();
          c.getItems();
        } else {
          statusrequest = StatusRequest.failure;
        }
      } else {
        return statusrequest;
      }
      update();
    }
  }

  @override
  void onInit() {
    getCategory();
    // catid = TextEditingController();
    itemsdiscount = TextEditingController();
    itemsprice = TextEditingController();
    // itemsactive = TextEditingController();
    itemscount = TextEditingController();
    itemsdes = TextEditingController();
    itemsname = TextEditingController();

    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    

    super.onInit();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   categoriesname.dispose();
  //   super.dispose();
  // }

  myBack() {
    Get.offAll(AdminHome());
    return Future.value(false);
  }

  getCategory() async {
    CategoriesAdminData categoriesAdminData = CategoriesAdminData(Get.find());

    // statusrequest = StatusRequest.loading;
    // update();
    var response = await categoriesAdminData.getData();
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List<CategoriesModelStatic> datacat = [];

        List datalist = response['data'];
        datacat.addAll(datalist.map((e) => CategoriesModelStatic.fromJson(e)));
        for (int i = 0; i < datacat.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: datacat[i].categoriesName!,
              value: datacat[i].categoriesId.toString()));
          
          


        }
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }
}
