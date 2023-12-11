import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/function/handilingdata.dart';
import '../../data/remote/panier_data.dart';
import '../../model/couponmodel.dart';
import '../../model/items_model.dart';
import '../../model/mypanier_model.dart';
import '../../services/services.dart';
import '../../views/users/checkout.dart';

class PanierController extends GetxController {
  TextEditingController? controllercoupon;
  double? discountcoupon = 0;
  var counter = 0;
  String? couponname;
  String? couponId;

  MyServices myServices = Get.find();
  PanierData panierData = PanierData(Get.find());
  StatusRequest? statusrequest;
  late ItemsModel itemsModel;
  late couponModel couponmodel;
  List<MyPanierModel> data = [];
  double totalprice = 0;
  //double totalprices = 0;

  int totalcount = 0;
  Map isPanier = {};
  setPanier(id, val) {
    isPanier[id] = val;
    update();
  }

  goToPageCheckOut() {
    if (data.isEmpty) return Get.snackbar('erreur', 'votre panier est vide');

    Get.to(CheckOut(), arguments: {
      'couponId': couponId ?? '0',
      'pricetotal': totalprice.toString(),
      'discountcoupon': discountcoupon.toString(),
    });
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

  totalPrice() {
    return (totalprice - totalprice * discountcoupon! / 100);
  }

  checkCoupon() async {
    statusrequest = StatusRequest.loading;
    update();

    var response = await panierData.CheckCoupon(controllercoupon!.text);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        Map<String, dynamic> mapcoupon = response['data'];
        couponmodel = couponModel.fromJson(mapcoupon);
        discountcoupon = double.parse(couponmodel.couponDiscount!);
        couponname = couponmodel.couponName;
        couponId = couponmodel.couponId;
        int.parse(couponmodel.couponCount!) - 1;
      } else {
        // statusrequest = StatusRequest.failure;
        couponname = null;
        discountcoupon = 0;
        Get.snackbar('Warning', 'coupon not valid');
      }
    } else {
      return statusrequest;
    }
    update();
  }

  reseatdata() {
    totalcount = 0;
    totalprice = 0;
    data.clear();
  }

  refreshData() {
    reseatdata();
    viewData();
  }

  viewData() async {
    update();

    //data.clear();
    statusrequest = StatusRequest.loading;
    update();
    var response =
        await panierData.getData(myServices.sharedPreferences.getString("id"));
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        //data.addAll(response['data']);
        List responsedata = response['data'];

        data.addAll(responsedata.map((e) => MyPanierModel.fromJson(e)));
        Map responsepriceandcount = response['datatotal'];
        totalprice = double.parse(responsepriceandcount['totalprice']);
        totalcount = int.parse(responsepriceandcount['totalcount']);
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
    controllercoupon = TextEditingController();
    viewData();
    //sumData();
    super.onInit();
  }
}
