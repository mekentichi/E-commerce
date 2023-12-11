import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../linkapi/linkapi.dart';

class ReseatPasswordData {
  Crud crud;
  ReseatPasswordData(this.crud);

  getData(email, password) async {
    var result = await crud.postData(LinkApi.Linkreseatpassword, {
      "email": "$email",
      "password": "$password",
    });
    return result.fold((l) => l, (r) => r);
  }
}
