class MyPanierModel {
  String? itemsprice;
  String? countitems;
  String? panierId;
  String? panierUsersid;
  String? panierItemsid;
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

  MyPanierModel(
      {this.itemsprice,
      this.countitems,
      this.panierId,
      this.panierUsersid,
      this.panierItemsid,
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

  MyPanierModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    panierId = json['panier_id'];
    panierUsersid = json['panier_usersid'];
    panierItemsid = json['panier_itemsid'];
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
    final Map<String, dynamic> MyPanierModel = new Map<String, dynamic>();
    MyPanierModel['itemsprice'] = this.itemsprice;
    MyPanierModel['countitems'] = this.countitems;
    MyPanierModel['panier_id'] = this.panierId;
    MyPanierModel['panier_usersid'] = this.panierUsersid;
    MyPanierModel['panier_itemsid'] = this.panierItemsid;
    MyPanierModel['items_id'] = this.itemsId;
    MyPanierModel['items_name'] = this.itemsName;
    MyPanierModel['items_descreption'] = this.itemsDescreption;
    MyPanierModel['items_image'] = this.itemsImage;
    MyPanierModel['items_count'] = this.itemsCount;
    MyPanierModel['items_active'] = this.itemsActive;
    MyPanierModel['items_price'] = this.itemsPrice;
    MyPanierModel['items_discount'] = this.itemsDiscount;
    MyPanierModel['items_date'] = this.itemsDate;
    MyPanierModel['items_categories'] = this.itemsCategories;
    return MyPanierModel;
  }
}

