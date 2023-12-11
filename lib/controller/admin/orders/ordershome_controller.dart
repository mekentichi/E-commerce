
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../views/admin/orders/acceptedadmin.dart';
import '../../../views/admin/orders/archiveadmin.dart';
import '../../../views/admin/orders/pendingadmin.dart';


abstract class ScreenHomeAdminController extends GetxController {
  changePage(value);
}

class ScreenHomeAdminControllerImp extends ScreenHomeAdminController {
  List<Widget> listPage = [
    // const HomePage(),
    
    PendingOrdersAdmin(),
    AcceptedOrdersAdmin(),
    ArchiveOrdersAdmin(),
    // ArchiveOrdersAdmin(),
    
  ];
  List listbuttonbarr = ["Pending", "Accepted", "Archive"];
  List<IconData> listicon = [
    Icons.pending,
    Icons.approval_rounded,
    Icons.archive,
    
  ];
  int currentPage = 0;

  get statusrequest => null;
  @override
  changePage(value) {
    currentPage = value;
    update();
  }
}
