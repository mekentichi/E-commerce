

import '../../../../core/class/crud.dart';
import '../../../../linkapi/linkapi.dart';

class AcceptedOrdersData {
  Crud crud;
  AcceptedOrdersData(this.crud);

  getData() async {
    var result = await crud
        .postData(LinkApi.acceptedorders,{});
    return result.fold((l) => l, (r) => r);
  }
}