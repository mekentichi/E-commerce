import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);

  getData(usersid) async {
    var result = await crud.postData(LinkApi.ordersPending, {
      "id": usersid,
    });
    return result.fold((l) => l, (r) => r);
  }
  deleteData(ordersid) async {
    var result = await crud.postData(LinkApi.ordersdelete, {
      "id": ordersid,
    });
    return result.fold((l) => l, (r) => r);
  }
  archiveData(usersid) async {
    var result = await crud.postData(LinkApi.ordersarchive, {
      "id": usersid,
    });
    return result.fold((l) => l, (r) => r);
  }
}
