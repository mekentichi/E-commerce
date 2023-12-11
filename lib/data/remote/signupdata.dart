import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  getData(username, email, phone, password) async {
    var result = await crud.postData(LinkApi.LinkSignup, {
      "username": "$username",
      "email": "$email",
      "phone": "$phone",
      "password": "$password",
    });
    return result.fold((l) => l, (r) => r);
  }
}
