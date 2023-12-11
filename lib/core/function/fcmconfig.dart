import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import '../../controller/orders/pendingorders_controller.dart';

requestPermissionNotification() async {
  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmcConfig() {
  FirebaseMessaging.onMessage.listen((event) {
  FlutterRingtonePlayer.playNotification();
    Get.snackbar(event.notification!.title!, event.notification!.body!);
    refreshPageOrders(event.data);
  });
}

refreshPageOrders(data) {
  PendingOrdersController controller = Get.put(PendingOrdersController());
  if (Get.currentRoute == "/PendingOrders" && data['pagename']=="refreshorderspending") {
    controller.refreshOrders();
  }
}
