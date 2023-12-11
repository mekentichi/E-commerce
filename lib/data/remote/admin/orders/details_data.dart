

import '../../../../core/class/crud.dart';
import '../../../../linkapi/linkapi.dart';

class DetailsOrdersData {
  Crud crud;
  DetailsOrdersData(this.crud);

  getData(String ordersid ) async {
    var result = await crud
        .postData(LinkApi.detailsorders,{
          "ordersid":ordersid,
        });
    return result.fold((l) => l, (r) => r);
  }
}