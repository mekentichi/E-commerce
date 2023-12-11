import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  getData(email, password) async {
    var result = await crud.postData(LinkApi.LinkLogin, {
      "email": "$email",
      "password": "$password",
    });
    return result.fold((l) => l, (r) => r);
  }
}
