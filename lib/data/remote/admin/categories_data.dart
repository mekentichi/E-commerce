import 'dart:io';
import '../../../core/class/crud.dart';
import '../../../linkapi/linkapi.dart';

class CategoriesAdminData {
  Crud crud;
  CategoriesAdminData(this.crud);

  getData() async {
    var result = await crud.postData(LinkApi.catview, {});
    return result.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var result = await crud.addRequestWithImageOne(LinkApi.catadd, data, file);
    return result.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var result = await crud.postData(LinkApi.catdelete, data);
    return result.fold((l) => l, (r) => r);
  }

  editData(Map data, [File? file]) async {
    var result;
    if (file == null) {
       result = await crud.postData(LinkApi.catedit, data);
      
    } else {
       result =
          await crud.addRequestWithImageOne(LinkApi.catedit, data, file);
      
    }
    return result.fold((l) => l, (r) => r);
  }
}
