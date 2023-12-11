import 'dart:io';
import '../../../core/class/crud.dart';
import '../../../linkapi/linkapi.dart';

class ItemsAdminData {
  Crud crud;
  ItemsAdminData(this.crud);

  getData() async {
    var result = await crud.postData(LinkApi.itemsview, {});
    return result.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var result =
        await crud.addRequestWithImageOne(LinkApi.itemsadd, data, file);
    return result.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var result = await crud.postData(LinkApi.itemsdelete, data);
    return result.fold((l) => l, (r) => r);
  }

  editData(Map data, [File? file]) async {
    var result;
    if (file == null) {
      result = await crud.postData(LinkApi.itemsedit, data);
    } else {
      result = await crud.addRequestWithImageOne(LinkApi.itemsedit, data,file);
    }

    return result.fold((l) => l, (r) => r);
  }
}
