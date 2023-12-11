import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addData(itemsid,usersid) async {
    var result = await crud
        .postData(LinkApi.favoriteAdd, {"itemsid": itemsid, "usersid": usersid});
    return result.fold((l) => l, (r) => r);
  }
  removeData(itemsid,usersid) async {
    var result = await crud
        .postData(LinkApi.favoriteRemove, {"itemsid": itemsid, "usersid": usersid});
    return result.fold((l) => l, (r) => r);
  }
  getData(usersid) async {
    var result = await crud
        .postData(LinkApi.myfavorite, {"usersid": usersid});
    return result.fold((l) => l, (r) => r);
  }
  deleteData(id) async {
    var result = await crud
        .postData(LinkApi.deletefromfavorite, {"id": id});
    return result.fold((l) => l, (r) => r);
  }
}