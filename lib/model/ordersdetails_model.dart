class OrdersDetails {
  String? itemsprice;
  String? countitems;
  String? panierId;
  String? panierUsersid;
  String? panierItemsid;
  String? panierOrders;
  String? itemsId;
  String? itemsName;
  String? itemsDescreption;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCategories;

  OrdersDetails(
      {this.itemsprice,
      this.countitems,
      this.panierId,
      this.panierUsersid,
      this.panierItemsid,
      this.panierOrders,
      this.itemsId,
      this.itemsName,
      this.itemsDescreption,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCategories});

  OrdersDetails.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    panierId = json['panier_id'];
    panierUsersid = json['panier_usersid'];
    panierItemsid = json['panier_itemsid'];
    panierOrders = json['panier_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDescreption = json['items_descreption'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['panier_id'] = this.panierId;
    data['panier_usersid'] = this.panierUsersid;
    data['panier_itemsid'] = this.panierItemsid;
    data['panier_orders'] = this.panierOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_descreption'] = this.itemsDescreption;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_categories'] = this.itemsCategories;
    return data;
  }
}