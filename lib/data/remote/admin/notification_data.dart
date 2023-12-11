import '../../../../core/class/crud.dart';
import '../../../../linkapi/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  
  sendData(String title,String body,) async {
    var result = await crud
        .postData(LinkApi.notificationpourtout,{
          "title":title,
          "body":body
        });
    return result.fold((l) => l, (r) => r);
  }
}