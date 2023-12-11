
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../data/remote/checkout_data.dart';
import '../../core/function/handilingdata.dart';
import '../../services/services.dart';
import '../../views/users/screenhome.dart';

class CheckOutController extends GetxController {
  CheckOutData checkOutData = CheckOutData(Get.find());
  StatusRequest? statusrequest;
  MyServices myServices = Get.find();

  String? paymentMethode;
  String? deliveryType;
  String? shippingAddress;
  late String couponId;
  late String priceorder;
  late String coupondiscount;

  choosePaymentMethode(String val) {
    paymentMethode = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  checkOut() async {
    if (deliveryType == null)
      return Get.snackbar('error', 'Please entre your delicery type');
    if (paymentMethode == null)
      return Get.snackbar('error', 'Please entre your payment methode');
    statusrequest = StatusRequest.loading;

    Map data = {
      'usersid': myServices.sharedPreferences.getString('id'),
      'addressid': '19',
      'odersprice': priceorder,
      'typedelivery': deliveryType.toString(),
      'pricedelivery': '500',
      'couponid': couponId,
      'coupondiscount': coupondiscount.toString(),
      'paymentmethode': paymentMethode.toString(),
    };
    var response = await checkOutData.checkOutdata(data);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == 'success') {
        Get.to(ScreenHome());
        deliveryType = null;
        paymentMethode = null;
        update();
      } else {
        statusrequest = StatusRequest.failure;
      }
    } else {
      return statusrequest;
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponId'];
    priceorder = Get.arguments['pricetotal'];
    coupondiscount = Get.arguments['discountcoupon'].toString();

    super.onInit();
  }
}
