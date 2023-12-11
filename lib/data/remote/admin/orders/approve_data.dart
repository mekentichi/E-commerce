

import '../../../../core/class/crud.dart';
import '../../../../linkapi/linkapi.dart';

class ApproveOrdersData {
  Crud crud;
  ApproveOrdersData(this.crud);

  approveddata(String usersid,String ordersid) async {
    var result = await crud
        .postData(LinkApi.approveorders,{
          "usersid":usersid,
          "ordersid":ordersid
        });
    return result.fold((l) => l, (r) => r);
  }
}