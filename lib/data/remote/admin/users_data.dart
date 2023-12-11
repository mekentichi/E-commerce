import '../../../../core/class/crud.dart';
import '../../../../linkapi/linkapi.dart';

class UsersData {
  Crud crud;
  UsersData(this.crud);

  getData() async {
    var result = await crud
        .postData(LinkApi.viewusers,{});
    return result.fold((l) => l, (r) => r);
  }
  editData(String id,String usersetats,) async {
    var result = await crud
        .postData(LinkApi.editusers,{
          "id":id,
          "usersetats":usersetats
        });
    return result.fold((l) => l, (r) => r);
  }
}