import 'package:flutter/material.dart';
import '../../controller/users/panier_controller.dart';
import '../../core/static/color.dart';
import 'package:get/get.dart';

class ButtonNavigationBar extends StatelessWidget {
  final String price;
  final String total;
  final String shipping;

  final String count;
  final void Function()? onTap;
  final TextEditingController? controllercoupon;
  final void Function()? onApplyCoupon;
  const ButtonNavigationBar(
      {super.key,
      required this.price,
      required this.total,
      required this.shipping,
      required this.count,
      required this.controllercoupon,
      required this.onApplyCoupon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PanierController>(
      builder: (controller) => Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<PanierController>(
                builder: (controller) => controller.couponname == null
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: controllercoupon,
                                  decoration: const InputDecoration(
                                      hintText: 'Coupon Code',
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 10)),
                                )),
                            const SizedBox(width: 10),
                            Expanded(
                                flex: 1,
                                child: MaterialButton(
                                  color: AppColor.secondycolor,
                                  onPressed: onApplyCoupon,
                                  child: const Text('Apply'),
                                ))
                          ],
                        ),
                      )
                    : Container(
                        child: Text(
                          'Coupon Code:${controller.couponname}',
                          style: TextStyle(
                              color: AppColor.secondycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColor.secondycolor),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Price', style: TextStyle(fontSize: 20)),
                        Text(price, style:const  TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Discount', style: TextStyle(fontSize: 20)),
                        Text(count, style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  // Divider(
                  //   height: 1.2,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Shipping', style: TextStyle(fontSize: 20)),
                        Text(shipping, style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: TextStyle(
                                fontSize: 20, color: AppColor.secondycolor)),
                        Text(total,
                            style: TextStyle(
                                fontSize: 20, color: AppColor.secondycolor)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: AppColor.secondycolor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity - 20,
                  height: 40,
                  child: const Text(
                    'Place Order',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
