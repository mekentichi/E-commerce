import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

 getData() async {
    var result = await crud.postData(LinkApi.offersitems, {});
    return result.fold((l) => l, (r) => r);
  }
}
