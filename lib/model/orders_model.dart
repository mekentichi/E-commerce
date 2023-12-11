class OrdersModel {
  String? ordersId;
  String? ordersUserid;
  String? ordersAddresse;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersTypedelivery;
  String? ordersPricedelivery;
  String? ordersDate;
  String? ordersCoupon;
  String? ordersPaymentmethode;
  String? ordersstatus;


  OrdersModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersAddresse,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersTypedelivery,
      this.ordersPricedelivery,
      this.ordersDate,
      this.ordersCoupon,
      this.ordersPaymentmethode,
      this.ordersstatus
      });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddresse = json['orders_addresse'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersTypedelivery = json['orders_typedelivery'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersDate = json['orders_date'];
    ordersCoupon = json['orders_coupon'];
    ordersPaymentmethode = json['orders_paymentmethode'];
    ordersstatus = json['orders_status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_addresse'] = this.ordersAddresse;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_typedelivery'] = this.ordersTypedelivery;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_date'] = this.ordersDate;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_paymentmethode'] = this.ordersPaymentmethode;
    data['orders_status'] = this.ordersstatus;

    return data;
  }
}