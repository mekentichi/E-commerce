import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class HomaPageData {
  Crud crud;
  HomaPageData(this.crud);

  getData() async {
    var result = await crud.postData(LinkApi.Linkhomepage, {});
    return result.fold((l) => l, (r) => r);
  }
  searchData(String search) async {
    var result = await crud
        .postData(LinkApi.linksearch, {"search": search,});
    return result.fold((l) => l, (r) => r);
  }
  
}
