import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../linkapi/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  getData(email, verifycode) async {
    var result = await crud.postData(LinkApi.Linkverifycodeforgetpassword, {
      "email": "$email",
      "verifycode": "$verifycode",
    });
    return result.fold((l) => l, (r) => r);
  }
  resendData(email) async {
    var result = await crud.postData(LinkApi.reSend,
        {"email": "$email"});
    return result.fold((l) => l, (r) => r);
  }
}
