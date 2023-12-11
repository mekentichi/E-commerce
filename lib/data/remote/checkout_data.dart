

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud);

  checkOutdata(Map data) async {
    var result = await crud
        .postData(LinkApi.checkOut,data);
    return result.fold((l) => l, (r) => r);
  }
}