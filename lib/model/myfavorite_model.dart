

class MyFavoriteModel {
  String? favoriteId;
  String? favoriteItemsid;
  String? favoriteUsersid;
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
  String? usersId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteItemsid,
      this.favoriteUsersid,
      this.itemsId,
      this.itemsName,
      this.itemsDescreption,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCategories,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteItemsid = json['favorite_itemsid'];
    favoriteUsersid = json['favorite_usersid'];
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
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_itemsid'] = this.favoriteItemsid;
    data['favorite_usersid'] = this.favoriteUsersid;
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
    data['users_id'] = this.usersId;
    return data;
  }
}