

import '../../../../core/class/crud.dart';
import '../../../../linkapi/linkapi.dart';

class ArchiveOrdersData {
  Crud crud;
  ArchiveOrdersData(this.crud);

  getData() async {
    var result = await crud
        .postData(LinkApi.archiveorders,{});
    return result.fold((l) => l, (r) => r);
  }
}