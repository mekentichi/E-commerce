import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class UpdateNotificationData {
  Crud crud;
  UpdateNotificationData(this.crud);

  getData(String usersid) async {
    var result = await crud.postData(LinkApi.updatenotification, {
      "usersid": usersid,
    });
    return result.fold((l) => l, (r) => r);
  }
}
