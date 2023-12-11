import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class PanierData {
  Crud crud;
  PanierData(this.crud);

  addData(itemsid,usersid) async {
    var result = await crud
        .postData(LinkApi.panierAdd, {"itemsid": itemsid, "usersid": usersid});
    return result.fold((l) => l, (r) => r);
  }
  removeData(itemsid,usersid) async {
    var result = await crud
        .postData(LinkApi.panierRemove, {"itemsid": itemsid, "usersid": usersid});
    return result.fold((l) => l, (r) => r);
  }
  getData(usersid) async {
    var result = await crud
        .postData(LinkApi.panierView, {"usersid": usersid});
    return result.fold((l) => l, (r) => r);
  }
  sumData(id) async {
    var result = await crud
        .postData(LinkApi.panierSum, {"id": id});
    return result.fold((l) => l, (r) => r);
  }
  counterData(itemsid,usersid) async {
    var result = await crud
        .postData(LinkApi.counter, {"itemsid": itemsid, "usersid": usersid});
    return result.fold((l) => l, (r) => r);
  }
  CheckCoupon(String Couponname) async {
    var result = await crud
        .postData(LinkApi.couponCheck, {"couponname": Couponname});
    return result.fold((l) => l, (r) => r);
  }
  
}