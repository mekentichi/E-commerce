import 'dart:io';

import 'package:Queen_Beauty/controller/admin/categories/view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/function/handilingdata.dart';
import '../../../core/function/uploadfile.dart';
import '../../../data/remote/admin/categories_data.dart';
import '../../../model/categories_model.dart';
import '../../../services/services.dart';
import '../../../views/admin/adminhome.dart';
import '../../../views/admin/categories/view.dart';

class CategoriesEditController extends GetxController {
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController categoriesname;
  CategoriesModelStatic? categoriesModel;

  CategoriesAdminData categoriesAdminData = CategoriesAdminData(Get.find());

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

  editItems() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      // if (file == null) return Get.snackbar('Warning', "Please Choose Image");
      Map data = {
        "nameimage": categoriesname.text,
        "imageold":categoriesModel!.categoriesImage!,
        "id":categoriesModel!.categoriesId!.toString()
      };
      // data.clear();
      statusrequest = StatusRequest.loading;
      update();
      var response = await categoriesAdminData.editData(data, file);
      statusrequest = handilingData(response);
      if (StatusRequest.success == statusrequest) {
        if (response['status'] == "success") {
          Get.off(CategoriesHomeView());
          CategoriesAdminController c = Get.find();
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
    categoriesModel = Get.arguments["categoriesModel"];
    categoriesname = TextEditingController();
    categoriesname.text = categoriesModel!.categoriesName!;

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    categoriesname.dispose();
    super.dispose();
  }

  myBack() {
    Get.offAll(AdminHome());
    return Future.value(false);
  }
}
