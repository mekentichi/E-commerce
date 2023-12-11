import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(String usersid) async {
    var result = await crud.postData(LinkApi.notification, {
      "usersid": usersid,
    });
    return result.fold((l) => l, (r) => r);
  }
}
