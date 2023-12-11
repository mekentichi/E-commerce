import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../linkapi/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  getData(email) async {
    var result = await crud.postData(LinkApi.Linkchekemail, {
      "email": "$email",
    });
    return result.fold((l) => l, (r) => r);
  }
}
