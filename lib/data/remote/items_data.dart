import 'package:get/get.dart';
import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class ItemsDataView {
  Crud crud;
  ItemsDataView(this.crud);

  getData(id,usersid) async {
    var result = await crud
        .postData(LinkApi.Linkitems, {"id": id, "usersid": usersid});
    return result.fold((l) => l, (r) => r);
  }
}
