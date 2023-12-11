import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../linkapi/linkapi.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postData(email, verifycode) async {
    var result = await crud.postData(LinkApi.LinkVerifyCode,
        {"email": "$email", "verifycode": "$verifycode"});
    return result.fold((l) => l, (r) => r);
  }
  resendData(email) async {
    var result = await crud.postData(LinkApi.reSend,
        {"email": "$email"});
    return result.fold((l) => l, (r) => r);
  }
}
