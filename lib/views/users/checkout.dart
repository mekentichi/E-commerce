import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/users/checkout_controller.dart';
import '../../core/static/color.dart';
import '../../widget/checkout/checkoutinformation.dart';
import '../../widget/checkout/chooseyourpayment.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('CheckOut'),
          backgroundColor: AppColor.secondycolor,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColor.secondycolor,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(20),
          child: MaterialButton(
            onPressed: () {
              controller.checkOut();
            },
            child: const Text(
              'CheckOut',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: GetBuilder<CheckOutController>(
          builder: (controller) => Container(
            margin: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Text(
                  'Choose Payment Method',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondycolor),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethode('Cash');
                  },
                  child: ChoosePaymentMethode(
                    isActive:
                        controller.paymentMethode == 'Cash' ? true : false,
                    title: 'Cash',
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.choosePaymentMethode('Payment Cards');
                  },
                  child: ChoosePaymentMethode(
                    isActive: controller.paymentMethode == 'Payment Cards'
                        ? true
                        : false,
                    title: 'Payment Cards',
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Choose Delivery Type',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondycolor),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.chooseDeliveryType('Delivery');
                  },
                  child: ChoosePaymentMethode(
                    isActive:
                        controller.deliveryType == "Delivery" ? true : false,
                    title: 'Delivery',
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    controller.chooseDeliveryType('Drive Thru');
                  },
                  child: ChoosePaymentMethode(
                    isActive:
                        controller.deliveryType == "Drive Thru" ? true : false,
                    title: 'Drive Thru',
                  ),
                ),
                const SizedBox(height: 20),
                if (controller.deliveryType == "Delivery")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping Adresse',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.secondycolor),
                      ),
                      const SizedBox(height: 10),
                      const CustominfoCheckOut(title: 'Name'),
                      const SizedBox(height: 10),
                      const CustominfoCheckOut(title: 'LastName'),
                      const SizedBox(height: 10),
                      const CustominfoCheckOut(title: 'Phone'),
                    ],
                  )
              ],
            ),
          ),
        ));
  }
}
