import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class CountNotificationData {
  Crud crud;
  CountNotificationData(this.crud);

  getData(usersid) async {
    var result = await crud.postData(LinkApi.countnotification, {"usersid":usersid});
    return result.fold((l) => l, (r) => r);
  }
  
  
}
