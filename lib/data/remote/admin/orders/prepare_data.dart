import '../../../../core/class/crud.dart';
import '../../../../linkapi/linkapi.dart';

class PrepareOrdersData {
  Crud crud;
  PrepareOrdersData(this.crud);

  checkOutdata(String usersid,String ordersid,String orderstype) async {
    var result = await crud
        .postData(LinkApi.approveorders,{
          "usersid":usersid,
          "ordersid":ordersid,
          "orderstype":orderstype
        });
    return result.fold((l) => l, (r) => r);
  }
}