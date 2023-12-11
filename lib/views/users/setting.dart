import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/users/setting_controller.dart';
import '../../core/static/color.dart';
import '../address/view.dart';
import '../orders/archiveorders.dart';
import '../orders/pendingorders.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2,
                color: AppColor.secondycolor,
              ),
              Positioned(
                  top: Get.width / 2.8,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                  )),
            ],
          ),
          const SizedBox(height: 80),
          Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  title: const Text('disable notification'),
                  trailing: Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColor.secondycolor,
                  ),
                ),
                ListTile(
                  onTap: () {
                    launchUrl(Uri.parse('tel:+213671926751'));
                  },
                  title: const Text('Contact Us'),
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                ListTile(
                  onTap: () {
                    Get.to(PendingOrders());
                  },
                  title: const Text('Orders Pending'),
                  trailing: const Icon(Icons.gif_box),
                ),
                ListTile(
                  onTap: () {
                    Get.to(ArchiveOrders());
                  },
                  title: const Text('Orders Archive'),
                  trailing: const Icon(Icons.archive),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('About Us'),
                  trailing: const Icon(Icons.help_outlined),
                ),
                ListTile(
                  onTap: () {
                    Get.to(AddressView());
                  },
                  title: const Text('Addresse'),
                  trailing: const Icon(Icons.location_on_outlined),
                ),
                ListTile(
                  onTap: () {
                    controller.logOut();
                  },
                  title: const Text('Deconnecté'),
                  trailing: const Icon(Icons.exit_to_app_outlined),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
