

import '../../../../core/class/crud.dart';
import '../../../../linkapi/linkapi.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);

  getData() async {
    var result = await crud
        .postData(LinkApi.pendingorders,{});
    return result.fold((l) => l, (r) => r);
  }
}